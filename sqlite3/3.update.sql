-- movie = Movie.objects.get(id=1)
-- movie.title = 'spider man'
-- movie.save()

SELECT * FROM movies_movie
WHERE id=1;

UPDATE movies_movie
SET title= 'iron man' -- UPDATE와 SET은 세트
WHERE id=1;