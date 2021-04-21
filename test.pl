#!/usr/bin/env python3
import json
import requests
highest_views = 0
highest_viewed = None
videos = {}
url = 'https://plsl-4-parking-api.c7n.app/'
try:  # get the data.
    response = requests.get(url)
    data = json.loads(response.text)
except requests.exceptions.RequestException as e:
    print("Nope.")
    raise SystemExit(e)
try:
    entries = data["feed"]["entry"]
except:
    print("I didn't understand the data from the URL", url)

for entry in entries:  # There's probably a one step way of doing this comparing the raw data from this, but it wasn't working for me- so!
    videos[entry["title"]["$t"]] = int(entry["yt$statistics"]['favoriteCount'])
#also could have been done with dictionary comprehension but my brain refused to parse the syntax for it at 23:39 and I gave up. ;)
# print(videos.items())

# this could also be done by getting a sorted copy of videos and returning the highest value, I'm sure.
for k, v in videos.items():
    if v > highest_views:
        highest_views = v
        highest_viewed = k
# And finally...
print("The most viewed video is", highest_viewed, "with", highest_views, "hits!")
