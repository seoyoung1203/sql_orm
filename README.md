- settings의 DATABASE를 바꾸고
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
다시 migrate > mySQL에 적용

>> 화살표 방향을 sqlite3 -> mySQL로 (두 곳에 모두 생성)

1. orm 문법
```shell
Movie.objects.create(title='dark night',year=2008)
```
2. SQL 문으로
```shell
insert into movies_movie (title, year)
values ('dark night', 2008)
 ```

 django-extensions
 ipython -셸 플러스 기능 개별로야 설치