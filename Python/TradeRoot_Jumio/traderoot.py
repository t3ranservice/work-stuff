import requests
import json
import os
from dotenv import load_dotenv
import time
from opentelemetry import trace
from opentelemetry.sdk.trace import TracerProvider
from opentelemetry.sdk.trace.export import BatchSpanProcessor
from opentelemetry.sdk.resources import SERVICE_NAME, SERVICE_NAMESPACE, SERVICE_INSTANCE_ID, Resource
from azure.monitor.opentelemetry.exporter import AzureMonitorTraceExporter
from opentelemetry.trace.status import Status, StatusCode
from metrics import *
import logging
from opencensus.ext.azure import metrics_exporter
from opencensus.ext.azure.log_exporter import AzureLogHandler
# Configuring logger to Azure, metrics exporter
load_dotenv()
logger = logging.getLogger(__name__)
logger.addHandler(AzureLogHandler(connection_string=os.environ.get('AZ_CONNECTION_STRING')))
logger.setLevel(logging.INFO)
logging.captureWarnings(True)
exporter = metrics_exporter.new_metrics_exporter(
        connection_string=os.environ.get('AZ_CONNECTION_STRING'))
logging.basicConfig(
    format="%(asctime)s:%(levelname)s:%(message)s", level=logging.WARNING)
file = logging.FileHandler("monitor.log")
logger.addHandler(file)

# Export traces (application mapping) though it does not work right now
exporter = AzureMonitorTraceExporter.from_connection_string(
    os.environ.get('AZ_CONNECTION_STRING'))

trace.set_tracer_provider(
    TracerProvider(
        resource=Resource.create(
            {
                SERVICE_NAME: "monitor-service",
                SERVICE_NAMESPACE: "TR",
                SERVICE_INSTANCE_ID: "AZ-instance",
            }
        )
    )
)

tracer = trace.get_tracer(__name__)
span_processor = BatchSpanProcessor(exporter)
trace.get_tracer_provider().add_span_processor(span_processor)

TR_url = os.environ.get('TR_URL')
TR_username = os.environ.get('TR_UNAME')
TR_passwd = os.environ.get('TR_PASSWD')
TR_memberReferenceNumber = os.environ.get('TR_MEMBERREFERENCENUMBER')

queries = {
    "initialiseSession": {
        "url": "/webapi/rest/resources/req/5/initialiseSession",
        "body": {
            "echoData": "Logon and logof",
            "tenantInstitutionIdCode": "99000000001",
            "schemeCode": "issuing_mobile"
        }
    },
    "LoginRequest": {
        "url": "/webapi/rest/resources/req/5/logon",
        "body": {
            "echoData":  "echoData",
            "sessionId": "sessionId",
            "authToken": "authToken",
            "username":  "username",
            "password":  "password"
        }
    },
    "listAccounts": {
        "url": "/webapi/rest/resources/req/5/listAccounts",
        "body": {
            "echoData": "echoData",
            "sessionId": "sessionId",
            "authToken": "authToken",
            "apiVersion": "v4",
            "memberId": "memberId"
        }
    },
    "searchMembers": {
        "url": "/webapi/rest/resources/req/5/searchMembers",
        "body": {
            "echoData": "echoData",
            "sessionId": "sessionId",
            "authToken": "authToken",
            "searchMembersCriteria": {
                "memberReferenceNumber": "memberReferenceNumber"
            }
        }
    }
}

with tracer.start_as_current_span("initialiseSession"):
    initialiseSession = queries.get('initialiseSession')
    url = TR_url+initialiseSession.get('url')
    query = initialiseSession.get('body')
    headers = {'Content-type': 'application/json',
               'Accept': 'application/json'}
    r = requests.post(url, data=json.dumps(query), headers=headers)
    if r.status_code == 200:
        print('initialiseSession OK')
        mmap.measure_int_put(initialise_200, 1)
        mmap.record(tmap)
        json_data = json.loads(r.text)
        authToken = json_data['authToken']
    else:
        mmap.measure_int_put(initialise_fails, 1)
        mmap.record(tmap)
        logger.error(f"InitialiseSession has failed. Response: {r.text}")
        SystemExit()
    echoData = json_data['echoData']
    sessionId = json_data['sessionId']
    authToken = json_data['authToken']

with tracer.start_as_current_span("LoginRequest") as span:
    LoginRequest = queries.get('LoginRequest')
    url = TR_url+LoginRequest.get('url')
    query = LoginRequest.get('body')
    query.update({"echoData":  echoData})
    query.update({"sessionId": sessionId})
    query.update({"authToken": authToken})
    query.update({"username":  TR_username})
    query.update({"password":  TR_passwd})

    r = requests.post(url, data=json.dumps(query), headers=headers)
    if r.status_code == 200:
        print('Login OK')
        mmap.measure_int_put(LoginRequest_200, 1)
        mmap.record(tmap)
        json_data = json.loads(r.text)
        memberId = json_data['memberId']
    else:
        mmap.measure_int_put(LoginRequest_fails, 1)
        mmap.record(tmap)
        logger.error(f"Login request failed. Response: {r.text}")
        SystemExit()
    authToken = json_data['authToken']


with tracer.start_as_current_span("listAccounts") as span:
    start_time = time.time()
    listAccounts = queries.get('listAccounts')
    url = TR_url+listAccounts.get('url')
    query = listAccounts.get('body')
    query.update({"echoData":  echoData})
    query.update({"sessionId": sessionId})
    query.update({"authToken": authToken})
    query.update({"memberId":  memberId})
    r = requests.post(url, data=json.dumps(query), headers=headers, timeout=180)
    execution_time = (time.time() - start_time)
    if r.status_code == 200:
        mmap.measure_int_put(listAccounts_200, 1)
        mmap.record(tmap)
        json_data = json.loads(r.text)
        accountId = json_data["accounts"]["account"][0]["accountId"]
        print('listAccounts OK')
    else:
        mmap.measure_int_put(listAccounts_fails, 1)
        mmap.record(tmap)
        logger.error(f"listAccounts failed, please check the response text: {r.text}. Execution time: {execution_time}")

with tracer.start_as_current_span("searchMembers"):
    searchMembers = queries.get('searchMembers')
    url = TR_url+searchMembers.get('url')
    query = searchMembers.get('body')
    query.update({"echoData":  echoData})
    query.update({"sessionId": sessionId})
    query.update({"authToken": authToken})
    query.update({"searchMembersCriteria": {"memberReferenceNumber": TR_username}})
    r = requests.post(url, data=json.dumps(query), headers=headers)
    if r.status_code == 200:
        mmap.measure_int_put(searchMembers_200, 1)
        mmap.record(tmap)
        json_data = json.loads(r.text)
        memberReferenceNumber = json_data["members"]["member"][0]["memberReferenceNumber"]
        print('searchMembers OK')
    else:
        mmap.measure_int_put(searchMembers_fails, 1)
        mmap.record(tmap)
        logger.warning(f"SearchMembers has failed. The response: {r.text}")
