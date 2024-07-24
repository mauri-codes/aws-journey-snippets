import os
import requests
import json

alias = os.environ["ALIAS"]
token = os.environ["TOKEN"]
region = os.environ["REGION"]
role_arn = os.environ["ROLE_ARN"]
account_id = os.environ["ACCOUNT_ID"]
url =  "https://apiv2.aws-journey.click/awsAccount"

def register_account():
   request_data = {
      "account_id": account_id,
      "alias": alias,
      "region": region,
      "role_arn": role_arn
   }

   data = json.dumps(request_data)
   headers = {
      "content-type": "application/json",
      "Authorization": f'Bearer {token}'
   }
   response = requests.put(url, data = data, headers = headers)
   print(json.loads(response.text))

register_account()
