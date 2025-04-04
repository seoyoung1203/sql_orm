-- 두 가지의 테이블을 하나로 합친다
-- cf) mary라는 유저가 쓴 게시물 찾기

-- 1번 유저가 작성한 모든 점수(scores)
-- user = User.objects.get(id=1)
-- user.score_set.all()
-- = Score.objects.filter(user_id=1)

SELECT * 
FROM movies_user JOIN movies_score
ON movies_user.id = movies_score.user_id
WHERE movies_user.id=1;

-- SELECT name, movies_score.id AS idd
-- FROM movies_user JOIN movies_score
-- ON movies_user.id = movies_score.user_id
-- WHERE movies_user.id=1;

-- 100번 영화가 어떤 카테고리에 속해있는지
-- Movie.objects.get(id=100).categories.all()

SELECT * -- 테이블 3개 합치기
FROM movies_movie JOIN movies_category_movies
ON movies_movie.id = movies_category_movies.movie_id -- 기준점 잡기
JOIN movies_category
ON movies_category_movies.category_id = movies_category.id
WHERE movies_movie.id=100; -- 뭘 찾고 싶어

-- drama 카테고리에 속한 모든 영화 출력

-- 카테고리의 드라마 찾기
-- Category.objects.get(name='drama')
-- Category.objects.get(name='drama').movies.all()
-- or
-- Category.objects.filter(name='drama')[0]
-- Category.objects.filter(name='drama')[0].movies.all()

-- SELECT * FROM movies_category;

SELECT *
FROM movies_category JOIN movies_category_movies -- 카테고리 중간테이블
ON movies_category.id = movies_category_movies.category_id
JOIN movies_movie
ON movies_category_movies.movie_id = movies_movie.id
WHERE movies_category.name = 'drama';

-- group by
-- User.objects.values('country').annotate(Count('id'))
SELECT country, COUNT(*) FROM movies_user
GROUP BY country;

SELECT country, AVG(value)
FROM movies_user JOIN movies_score
ON movies_user.id = movies_score.user_id
GROUP BY country;
