 Write the SQL statements needed to insert data into the new join table
  to represent the existing one-to-many relationships.
1	John McTiernan
2	2	Michael Curtiz
3	3	Francis Ford Coppola
4	4	Michael Anderson
5	5	Tomas Alfredson
6	6	Mike Nichols
7	7	Sidney Lumet
8	8	Penelope Spheeris


1	1	Die Hard	1988	action	132	1
2	2	Casablanca	1942	drama	102	2
3	3	The Conversation	1974	thriller	113	3
4	4	1984	1956	scifi	90	4
5	5	Tinker Tailor Soldier Spy	2011	espionage	127	5
6	6	The Birdcage	1996	comedy	118	6
7	7	The Godfather	1972	crime	175	3
8	8	12 Angry Men	1957	drama	96	7
9	9	Wayne's World	1992	comedy	95	8
10	10	Let the Right One In	2008	horror	114	4

INSERT INTO films_directors (film_id, director_id)
VALUES (1, 1),
       (2, 2),
       (3, 3),
       (4, 4),
       (5, 5),
       (6, 6),
       (7, 3),
       (8, 7),
       (9, 8),
       (10, 4);