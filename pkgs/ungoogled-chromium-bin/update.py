#!/usr/bin/env nix-shell
#!nix-shell -i python3 -p python3 python3Packages.requests python3Packages.feedparser

from html.parser import HTMLParser

import json
import feedparser
import requests


class MyHTMLParser(HTMLParser):
    # see https://docs.python.org/3/library/html.parser.html
    def __init__(self):
        super().__init__()
        self.download_url = None
        self.download_sha256 = None
        self.__sha256_found = False

    def handle_starttag(self, tag, attrs):
        if tag == "a":
            for (name, value) in attrs:
                if name == "href" and value.endswith("linux.tar.xz"):
                    self.download_url = value
                    break

    def handle_data(self, data):
        if self.__sha256_found:
            self.download_sha256 = data
        self.__sha256_found = data.lower().startswith("sha256")


print("Determining latest version...")
d = feedparser.parse(
    'https://raw.githubusercontent.com/ungoogled-software/ungoogled-chromium-binaries/master/feed.xml'
)
version = ""
url = ""
for entry in d.entries:
    title = entry.title_detail.value
    if title.startswith("Portable Linux 64-bit") and title.find("musl") == -1:
        version = title[title.find(":") + 1:].strip()
        url = entry.links[0].href
        break

print("Latest version:", version)
print("Attempting to find download URL on page:", url)
r = requests.get(url)

parser = MyHTMLParser()
parser.feed(r.text)
print("url:", parser.download_url)
print("sha256:", parser.download_sha256)

my_dict = {
    "version": version,
    "url": parser.download_url,
    "sha256": parser.download_sha256
}
with open("metadata.json", "w") as out_file:
    json.dump(my_dict, out_file, indent=2)
