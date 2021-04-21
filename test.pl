#!/usr/bin/env python3
import requests
import json

url = "https://plsl-4-parking-api.c7n.app/"
r = requests.get(url)
cont = json.loads(r.content)
print(cont)
