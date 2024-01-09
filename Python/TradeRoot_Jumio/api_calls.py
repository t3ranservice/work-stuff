from metrics import *
import requests
import sys
import json
import base64
from aws_requests_auth.aws_auth import AWSRequestsAuth
import logging
from opencensus.ext.azure.log_exporter import AzureLogHandler
import os
from dotenv import load_dotenv
from opencensus.ext.azure import metrics_exporter

# Jumio credentials
basic_accs = base64.b64encode(b"EDITED").decode("ascii")

# AirShip credentials
AI_header = "application/vnd.urbanairship+json; version=3"
XUAAppkey = "EDITED"
BearerTokenAI = "EDITED"
AI_basic = base64.b64encode(b"EDITED").decode("ascii")

# Logger setup
load_dotenv()

logger = logging.getLogger(__name__)
logger.addHandler(AzureLogHandler(connection_string=os.environ.get('AZ_CONNECTION_STRING')))
logger.setLevel(logging.INFO)
logging.captureWarnings(True)
exporter = metrics_exporter.new_metrics_exporter(
        connection_string=os.environ.get('AZ_CONNECTION_STRING'))

def ai_named_users():
    headers = {"Authorization": "Basic " + AI_basic,
               "Accept": AI_header}
    r = requests.get("https://go.airship.eu/api/named_users", headers=headers)
    print("Airship1 " + str(r.status_code))
    if r.status_code == 200:
        mmap.measure_int_put(airship_users_200, 1)
        mmap.record(tmap)
    else:
        mmap.measure_int_put(airship_users_fail, 1)
        mmap.record(tmap)
        logger.error(f"AirShip /api/named_users fail reason: {r.text}")
# -------

def ai_email():
    headers_email = {"Authorization": "Bearer " + BearerTokenAI,
                 "Accept": AI_header,
                 "Content-Type": "application/json"}
    body_email = {"channel": {"type": "email", "address": "terandanya1718@gmail.com"}}
    r = requests.post("https://go.airship.eu/api/channels/email", headers=headers_email, data=json.dumps(body_email))
    print("Airship2 " + str(r.status_code))
    if r.status_code == 200 or 201:
        mmap.measure_int_put(airship_email_200, 1)
        mmap.record(tmap)
    else:
        mmap.measure_int_put(airship_email_fail, 1)
        mmap.record(tmap)
        logger.error(f"AirShip /api/channels/email fail reason: {r.text}")
# -------

def ai_events():
    headers_events = {"Authorization": "Bearer " + BearerTokenAI,
                  "X-UA-Appkey": XUAAppkey,
                  "Accept": AI_header,
                  "Content-Type": "application/json"}
    body_events = {"user": {"named_user_id": "EDITED"}, "body": {"name": "123"}}
    r = requests.post("https://go.airship.eu/api/custom-events", headers=headers_events, data=json.dumps(body_events))
    print("Airship3 " + str(r.status_code))
    if r.status_code == 200:
        mmap.measure_int_put(airship_events_200, 1)
        mmap.record(tmap)
    else:
        mmap.measure_int_put(airship_events_fail, 1)
        mmap.record(tmap)
        logger.error(f"AirShip /api/custom-events fail reason: {r.text}")


def shiplogic_call():
    auth = AWSRequestsAuth(aws_access_key='EDITED',
                           aws_secret_access_key='EDITED',
                           aws_host='api.shiplogic.com',
                           aws_region='af-south-1',
                           aws_service='execute-api')

    body = {}

    response = requests.get('https://api.shiplogic.com/shipments?tracking_reference=EDITED', auth=auth, data=body)
    print("Shiplogic call: " + str(response.status_code))
    if response.status_code == 200:
        mmap.measure_int_put(shiplogic_200, 1)
        mmap.record(tmap)
    else:
        mmap.measure_int_put(shiplogic_fails, 1)
        mmap.record(tmap)
        logger.error(f"Shiplogic fail reason: {r.text}")


def get_new_token():
    auth_server_url = "https://auth.emea-1.jumio.ai/oauth2/token"
    client_id = "EDITED"
    client_secret = "EDITED"
    auth_headers = {'Accept': 'application/json',
                    'Content-Type': 'application/x-www-form-urlencoded'}
    token_req_payload = {'grant_type': 'client_credentials'}
    token_response = requests.post(auth_server_url,
                               data=token_req_payload, verify=False, allow_redirects=False,
                               auth=(client_id, client_secret), headers=auth_headers)
    if token_response.status_code != 200:
        print("Failed to obtain token from the OAuth 2.0 server", file=sys.stderr)
        mmap.measure_int_put(token_auth_fails, 1)
        mmap.record(tmap)
        logger.error(f"Jumio auth failed: {token_response.text}")
        return "Failed"
    else:
        mmap.measure_int_put(token_auth_200, 1)
        mmap.record(tmap)
        print("Successfully obtained a new token")
        return token_response.json()["access_token"]


def call_api_v1_accounts(token):
    api_call_headers = {
                        'Content-Length': '10204',
                        'Content-Type': 'application/json',
                        'User-Agent': 'LulaLend',
                        'Authorization': 'Bearer ' + token}

    data = {"customerInternalReference" : 5,
            "workflowDefinition":
            {"key": 32, "credentials":
                [
                    {"category":"ID","type":
                        {"values":[]},"country":
                        {"values":[],"predefinedType":"RECOMMENDED"}}]},
                "callbackUrl":"https://EDITED/EDITED",
                "userReference": 45}
    api_call_response = requests.post("https://account.emea-1.jumio.ai/EDITED", headers=api_call_headers, data=json.dumps(data), verify=False)
    print("Jumio accounts status code: " + str(api_call_response.status_code))
    if api_call_response.status_code == 200:
        mmap.measure_int_put(api_accounts_200, 1)
        mmap.record(tmap)
    else:
        mmap.measure_int_put(api_accounts_fails, 1)
        mmap.record(tmap)
        logger.error(f"Jumio /v1/accounts failed: {api_call_response.text}")


def call_api_netverify_acquisitions():
    api_call_headers = {
        'Content-Length': '1234',
        'Content-Type': 'application/json',
        'User-Agent': 'LulaLend',
        'Authorization': 'Basic ' + basic_accs}

    data = {'type': 'BC', 'country': 'ZAF', 'merchantScanReference': '6',
            'customerId': '5', "CallbackUrl": "https://EDITED/EDITED",
            "EnableExtraction": "false"}
    api_call_response = requests.post("https://acquisition.lon.netverify.com/api/netverify/v2/acquisitions", headers=api_call_headers, data=json.dumps(data), verify=True)
    print("Jumio acuqisitons status code: " + str(api_call_response.status_code))
    if api_call_response.status_code == 200:
        mmap.measure_int_put(acquisitions_200, 1)
        mmap.record(tmap)
        return api_call_response.json()["scanReference"]
    else:
        mmap.measure_int_put(acquisitions_fails, 1)
        mmap.record(tmap)
        logger.error(f"Jumio acuqisitions failed: {api_call_response.text}")
