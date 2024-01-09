import logging
from opencensus.ext.azure import metrics_exporter
from opencensus.ext.azure.log_exporter import AzureLogHandler
from api_calls import *
from dotenv import load_dotenv
import os

load_dotenv()
logger = logging.getLogger(__name__)
logger.addHandler(AzureLogHandler(connection_string=os.environ.get('AZ_CONNECTION_STRING')))
logger.setLevel(logging.INFO)
logging.captureWarnings(True)
exporter = metrics_exporter.new_metrics_exporter(
        connection_string=os.environ.get('AZ_CONNECTION_STRING'))

# Jumio calls
token = get_new_token()
call_api_v1_accounts(token)
call_api_netverify_acquisitions()

# Shiplogic call
shiplogic_call()

# AirShip calls
ai_named_users()
ai_email()
ai_events()
