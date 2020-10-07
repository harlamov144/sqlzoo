-- 1. Show the total number of prizes awarded.
SELECT COUNT(winner) FROM nobel


-- 2. List each subject - just once
select distinct subject from nobel


-- 3. Show the total number of prizes awarded for Physics. nobel(yr, subject, winner)
select count(winner) from nobel where subject = 'Physics'


-- 4. For each subject show the subject and the number of prizes. nobel(yr,subject, winner)
select subject, count(winner) from nobel group by subject


-- 5. For each subject show the first year that the prize was awarded. nobel(yr, subject, winner)
select subject, min(yr) from nobel group by subject


-- 6. For each subject show the number of prizes awarded in the year 2000. nobel(yr, subject, winner)
select subject, count(winner) from nobel where yr = 2000 group by subject


-- 7. Show the number of different winners for each subject. nobel(yr, subject, winner)
select subject, count(distinct winner) from nobel group by subject


-- 8. For each subject show how many years have had prizes awarded. nobel(yr, subject, winner)
select subject, count(distinct yr) from nobel group by subject


-- 9. Show the years in which three prizes were given for Physics. nobel(yr, subject, winner)
select yr from nobel where subject = 'Physics' group by yr having count(winner) = 3


-- 10. Show winners who have won more than once. nobel(yr, subject, winner)
select winner from nobel group by winner having count(winner) > 1


-- 11. Show winners who have won more than one subject. nobel(yr, subject, winner)
select winner from nobel group by winner having count(distinct subject) > 1


-- 12. Show the year and subject where 3 prizes were given. Show only years 2000 onwards. nobel(yr, subject, winner)
select yr, subject from nobel where yr >= 2000 group by yr, subject having count(winner) = 3