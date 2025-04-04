# 2025/04/03
- 키워드와 데이터(또는 변수)를 구분하기 위해서 대문자 사용
- C  -> insert
- R
 ### pip install
django faker
mysqlclient
django-extensions
ipython >셸 플러스 기능 개별로야 설치

- python manage.py shell_plus 
-> orm 문법 터미널에서 사용

- exit() 나갈게요
--------

1. models.py에서 저장할 모델을 정의

2. 새 모델을 만들었으니까 데이터베이스에 반영(마이그레이션)

3. Custom Command 생성 (generate.py)
Django의 management/commands/ 폴더에 새로운 명령어를 만들기
    - 폴더구조 
    myapp/management/commands/__init__.py
    myapp/management/commands/generate.py

4. generate.py 작성

5. 터미널에서 명령어 실행
```python
python manage.py generate
```
---------

- Workbench로 할게여(최종적으로는 x)
1. settings의 DATABASE를 바꾸고
```shell
DATABASES = {
    'default' :{
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'mydb',
        'HOST': 'localhost',
        'PORT': '3306',
        'USER': 'root',
        'PASSWORD': 'password',
    }
}
```
2. 다시 migrate > mySQL에 적용
```python
python manage.py sqlmigrate movies 0001
```
mysqlclient 이거 install 하고

```python
python manage.py migrate
```

-> 화살표 방향을 sqlite3 -> mySQL로 (두 곳에 모두 생성)
-------------

1. orm
```shell
Movie.objects.create(title='dark night',year=2008)
```
2. SQL
```shell
insert into movies_movie (title, year)
values ('dark night', 2008)
 ```
---------
 - ORDER BY 정렬 기능
 - ORDER BY DESC 내림차순 정렬
 
 - like >> 글자 검사 기능

 - distinct >> 중복을 제거하는 코드

 - __in >> 내가 주는 데이터에 일치하는 친구들

 - lt=30 → "age가 30 미만"
 - lte=30 → "age가 30 이하"
 - gt=20 → "age가 20 초과"
 - gte=20 → "age가 20 이상"

 - 터미널 클리어 -> ctrl L