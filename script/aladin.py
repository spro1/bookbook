import requests
import datetime
import json
import pprint

"""
메인 페이지에 뿌려줄 알라딘 데이터 파싱 스크립트

    1. 당일 베스트 셀러 파싱
    2. 당일 추천 신간 리스트 파싱
    3. 신작 리스트 파싱

    4. JSON 형태로 파일 데이터 저장
    5. 일일 데이터 MySQL 통해서 저장

"""


def parsing(url):
    req = requests.get(url)
    j = req.json()
    pprint.pprint(j)
    return j


if __name__ == "__main__":
    # aladin best seller parsing
    best = parsing(
        "http://www.aladin.co.kr/ttb/api/ItemList.aspx?ttbkey=ttbspro11046001&QueryType=bestseller&output=js&searchTarget=book&Version=20131101")
    # aladin new book
    new = parsing(
        "http://www.aladin.co.kr/ttb/api/ItemList.aspx?ttbkey=ttbspro11046001&QueryType=ItemNewAll&output=js&searchTarget=book&Version=20131101")
    # aladin recommand new book
    new_special = parsing(
        "http://www.aladin.co.kr/ttb/api/ItemList.aspx?ttbkey=ttbspro11046001&QueryType=ItemNewSpecial&output=js&searchTarget=book&Version=20131101")

    # save json
    js_path = "aladin.json"
    js_file = {"best_seller": best, "new_book": new, "recommand_book": new_special,
               "update": str(datetime.datetime.now())}
    with open(js_path, 'w', encoding="utf-8") as outfile:
        json.dump(js_file, outfile, ensure_ascii=False, indent=2)
    # save mysql
    # create mysql connect func
    # type = json


