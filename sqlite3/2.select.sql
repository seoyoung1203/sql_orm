-- Movie.objects.all() 전체 가져오기
select * from movies_movie;

--User.objects.all()
select * from movies_user;

-- 정렬
-- Movie.objects.all().order_by('year')
select * from movies_movie --데이터 가져오기
order by year; -- 연도별 정렬(오름차순)

-- Movie.objects.all().order_by('-year')
select * from movies_movie --데이터 가져오기
order by year DESC; -- 연도별 정렬(내림차순)

-- User.objects.filter(age=31)
select * from movies_user
where age=31;

-- User.objects.filter(age__lt=20) less than
select * from movies_user
where age<20;

-- 20대 
-- User.objects.filter(age__gte=20, age__lt=30) greater than / less than
select * from movies_user
where age >= 20 and age < 30;

-- Movie.objects.filter(Q(year__lt=2000)|Q(year__gt=2010))
select * from movies_movie
where year < 2000 or year > 2010;

-- Movie.objects.aggregate(Max('year'))
select title, MAX(year) from movies_movie; -- 최근 개봉작 찾기 

-- User.objects.aggregate(Avg('age'))
select AVG(age) from movies_user; -- 유저의 평균찾기

-- 1번 영화의 평균 평점

-- In [15]: Score.objects.filter(movie_id=1).aggregate(Max('value'), Avg('value'))

-- 1) 1번 영화 뽑아내기 
-- select * from movies_score
-- where movie_id=1; 

--2) 평점과 최대 찾기(뽑아내기와 한번에)
select MAX(value), AVG(value) from movies_score
where movie_id=1; 

-- len(Score.objects.filter(user_id=1))
-- Score.objects.filter(user_id=1).count()
select count(*) from movies_score
where user_id=1;

-- Movie.objects.filter(title__contains='the')
select * from movies_movie
where title like '%the%';

-- Movie.objects.filter(title__startswith='the')
select * from movies_movie
where title like 'the%'; -- 앞글자가 the로 시작

-- Movie.objects.filter(title__endswith='on.')
select * from movies_movie
where title like '%on.'; -- 뒷글자가 on으로 끝나는

--ORM에서 사용하려면 정규표현식을 사용해야 합니다. > 데이터에 맞는 정규식 검색해서 사용
select * from movies_movie
where title like '%g__d%';

-- User.objects.values('country').distinct().count()
select count(distinct country) from movies_user; -- distinct >> 중복을 제거(신기한 나라만)

-- User.objects.filter(age__range=[20, 29])
select * from movies_user
where age between 20 and 29;

-- Movie.objects.filter(year__in=[2000,2005, 2010]) -- __in >> 내가 주는 데이터에 일치하는 친구들
select * from movies_movie
where year in (2000, 2005, 2010);

