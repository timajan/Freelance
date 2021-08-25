import requests
from bs4 import BeautifulSoup
import csv
import random
import asyncio

url = 'https://rieltor.ua/firms/'

# разные прокси
proxy_list = [
    f"http://login:password@88.888.888.888:8888/",
    f"http://login:password@88.888.888.888:8888/",
    f"http://login:password@88.888.888.888:8888/", 
    f"http://login:password@88.888.888.888:8888/",
    f"http://login:password@88.888.888.888:8888/",
    f"http://login:password@88.888.888.888:8888/",
    f"http://login:password@88.888.888.888:8888/",
    f"http://login:password@88.888.888.888:8888/",
    f"http://login:password@88.888.888.888:8888/",
]


selected = random.choice(proxy_list)
proxies = {protocol: selected for protocol in ('http', 'https')}


async def get_data(url):
    req = requests.get(url, proxies=proxies)
    with open('project.html', 'w') as file:
        file.write(req.text)

asyncio.run(get_data('https://rieltor.ua/firms/'))

