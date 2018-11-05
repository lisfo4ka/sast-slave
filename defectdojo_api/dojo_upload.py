from defectdojo_api import defectdojo
from datetime import datetime, timedelta
import requests
import os

host = os.environ['DOJO_API_HOST']
api_key = os.environ['DOJO_API_KEY']
user = os.environ['DOJO_API_USER']

engagement_id = os.environ['DOJO_ENGAGEMENT_ID']
scan_type = os.environ['DOJO_SCAN_TYPE']
scan_file = os.environ['DOJO_API_FILE']
active = os.environ['DOJO_API_ACTIVATE']
date = datetime.now()
scan_date = date.strftime("%Y-%m-%d")

dd = defectdojo.DefectDojoAPI(host, api_key, user, debug=True)

test_id = dd.upload_scan(engagement_id, scan_type, scan_file, active, scan_date)
print test_id.data_json(pretty=True)
