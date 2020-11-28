from django.shortcuts import render
import json
import configparser
import requests
import xmltodict

config = configparser.ConfigParser()
config.read("static/config/setting.ini")
ttbkey = config['default']['ttbkey']


# Create your views here.
# main page view
def main_page(request):
    with open("static/data/aladin.json", encoding='utf-8') as js_file:
        aladin = json.load(js_file)
    return render(request, 'main/main_page.html', {'page': 'main_page', 'aladin': aladin})


# search view
def search_page(request):
    q = request.GET.get('q', '')
    if q:
        # 알라딘 검색
        url = "http://www.aladin.co.kr/ttb/api/ItemSearch.aspx?ttbkey=%s&Query=%s&Start=1&MaxResults=20&output=xml"%(ttbkey, q)
        print(url)
        req = requests.get(url)
        data = xmltodict.parse(req.text)
        data = json.dumps(data, ensure_ascii=False)
        data = json.loads(data)
    else:
        data = "not q"


    # mysql 조회
    # 글목록 조회
    return render(request, 'main/search_page.html', {'page': 'search_page', 'data': data, 'query' : q})
