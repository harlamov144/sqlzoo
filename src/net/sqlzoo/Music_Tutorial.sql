The Music database
This tutorial introduces the notion of a join. The music has two tables: album and track.

album(asin, title, artist, price, release, label, rank)
track(album, dsk, posn, song)

-- 1. Find the title and artist who recorded the song 'Alison'.
SELECT title, artist
FROM album JOIN track
                ON (album.asin=track.album)
WHERE song = 'Alison'


-- 2. Which artist recorded the song 'Exodus'?
select artist from album join track on album.asin = track.album where track.song = 'Exodus'


--3. Show the song for each track on the album 'Blur'
select song from track join album on track.album = album.asin where album.title = 'Blur'


-- 5. For each album show the title and the total number of tracks containing the word 'Heart'
-- (albums with no such tracks need not be shown).
select title, count(track.song) from album join track on album.asin = track.album where track.song like '%Heart%' group by title


-- 6. A "title track" is where the song is the same as the title. Find the title tracks.
select song from track join album on album.asin = track.album where track.song = album.title


-- 7. An "eponymous" album is one where the title is the same as the artist (for example the album 'Blur' by the band 'Blur').
--  Show the eponymous albums.
select title from album where artist = title


-- 8. Find the songs that appear on more than 2 albums. Include a count of the number of times each shows up.
select song, count(distinct album.title) from album join track on track.album = album.asin group by song
having count(distinct album.title) > 2


-- 9. A "good value" album is one where the price per track is less than 50 pence. Find the good value album - show the
-- title, the price and the number of tracks.
select title, price, count(track.song) from album join track on album.asin = track.album
group by title, price having price/count(track.song) < 0.5


-- 10. Wagner's Ring cycle has an imposing 173 tracks, Bing Crosby clocks up 101 tracks.
-- List albums so that the album with the most tracks is first. Show the title and the number of tracks
-- Where two or more albums have the same number of tracks you should order alphabetically
select title, count(song) from album join track on album.asin = track.album group by title order by count(song) desc, title
