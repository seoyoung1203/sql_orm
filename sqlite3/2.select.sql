-- Movie.objects.all() 전체 영화 가져오기
SELECT * FROM movies_movie;
SELECT * FROM movies_score;

--User.objects.all() 전체 유저 가져오기
SELECT * FROM movies_user;

-- 정렬

-- Movie.objects.all().order_by('year')
SELECT * FROM movies_movie --데이터 가져오기
ORDER BY year; -- 연도별 정렬(오름차순)

-- Movie.objects.all().order_by('-year')
SELECT * FROM movies_movie --데이터 가져오기
ORDER BY year DESC; -- 연도별 정렬(내림차순)

-- User.objects.filter(age=31)
SELECT * FROM movies_user
WHERE age=31;

-- User.objects.filter(age__lt=20) >> less than
SELECT * FROM movies_user
WHERE age<20;

-- 20 이상 과 30 미만
-- User.objects.filter(age__gte=20, age__lt=30) >> greater than / less than
SELECT * FROM movies_user
WHERE age >= 20 AND age < 30;

-- (개봉일) 2000년도 이전 거나 2010년 이후
-- Movie.objects.filter(Q(year__lt=2000)|Q(year__gt=2010))
SELECT * FROM movies_movie
WHERE year < 2000 OR year > 2010;

-- 최근 개봉작 찾기 
-- Movie.objects.aggregate(Max('year'))
SELECT title, MAX(year) FROM movies_movie; 

-- 유저의 평균찾기
-- User.objects.aggregate(Avg('age'))
SELECT AVG(age) FROM movies_user; 

-- 1번 영화의 평균 평점
-- In [15]: Score.objects.filter(movie_id=1).aggregate(Max('value'), Avg('value'))

-- 1) 1번 영화 뽑아내기 
-- select * from movies_score
-- where movie_id=1; 

--2) 평점과 최대 찾기(뽑아내기와 한번에)
SELECT MAX(value), AVG(value) FROM movies_score
WHERE movie_id=1; 

-- 1번 유저 뽑기와 세기
-- len(Score.objects.filter(user_id=1)) 모든 데이터를 가져온 후 개수를 셈
-- Score.objects.filter(user_id=1).count() 데이터베이스에서 직접 개수를 셈
SELECT COUNT(*) FROM movies_score
WHERE user_id=1;

-- 'the'가 들어간 영화제목
-- Movie.objects.filter(title__contains='the')
SELECT * FROM movies_movie
WHERE title LIKE '%the%';

-- 앞글자가 the로 시작
-- Movie.objects.filter(title__startswith='the')
SELECT * FROM movies_movie
WHERE title LIKE 'the%'; 

-- 뒷글자가 on으로 끝나는
-- Movie.objects.filter(title__endswith='on.')
SELECT * FROM movies_movie
WHERE title LIKE '%on.'; 

-- g로 시작하고 d로 끝나는 (4글자)
--ORM에서 사용하려면 정규표현식을 사용해야 합니다. > 데이터에 맞는 정규식 검색해서 사용
SELECT * FROM movies_movie
WHERE title LIKE '%g__d%';

-- User.objects.values('country').distinct().count()
SELECT COUNT(DISTINCT country) FROM movies_user; -- distinct >> 중복을 제거(고유한 나라만 세기)

-- User.objects.filter(age__range=[20, 29])
SELECT * FROM movies_user
WHERE age BETWEEN 20 AND 29;

-- Movie.objects.filter(year__in=[2000,2005, 2010]) -- __in >> 내가 주는 데이터에 일치하는 친구들
SELECT * FROM movies_movie
WHERE year IN (2000, 2005, 2010);

