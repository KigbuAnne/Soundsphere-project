1. #The first 20 recordsfrom the dataset.
SELECT*
FROM Spotify
Limit 20;

2. # Count the total number of songs and unique artists
SELECT 
	COUNT(*),
	COUNT(DISTINCT 'artist(s)_name')    
 FROM spotify; 

3. #Find the most popular songs
#We need to correct the name in Column 1
ALTER TABLE spotify
CHANGE COLUMN `ï»¿track_name` track_name VARCHAR(255);

SELECT 
    track_name,
    `artist(s)_name` AS popular_artists,
	 streams  AS popular_songs
FROM spotify
ORDER BY popular_songs DESC
LIMIT 10;
4. # Find The Top 5 artists with the highest average popularity.
SELECT `artist(s)_name`,
       AVG(streams) AS avg_streams
FROM Spotify
GROUP BY `artist(s)_name`
ORDER BY avg_streams DESC
LIMIT 5;
5. # List songs with danceability greater than 0.8
#Danceability is stored as percentage , therefore i will list songs with danceability greater than 80%
SELECT 
    track_name,
    `danceability_%` AS danceability
FROM Spotify
WHERE `danceability_%` > 80;

6. #Find songs with high energy(above 0.75 and high popularity(above 75)
SELECT 
    track_name,
    streams,
    `energy_%` AS energy
FROM Spotify
WHERE `energy_%` > 75
ORDER BY streams DESC
LIMIT 250
7.#Convert song duration from milisecond to minutes and find the average duration.
SELECT 
    AVG(bpm / 60000) AS avg_duration_minutes
FROM Spotify;

8.# Find songs longer than 5 minutes
DESCRIBE Spotify;

9. # Group songs by popularity ranges(0-21, 21-40, 41-60, 61-80, 81-100)and count the songs in each range.
SELECT 
    CASE 
        WHEN streams BETWEEN 0 AND 20 THEN '0-20'
        WHEN streams BETWEEN 21 AND 40 THEN '21-40'
        WHEN streams BETWEEN 41 AND 60 THEN '41-60'
        WHEN streams BETWEEN 61 AND 80 THEN '61-80'
        WHEN streams BETWEEN 81 AND 100 THEN '81-100'
    END AS streams_range,
    COUNT(*) AS song_count
FROM spotify
GROUP BY streams_range
ORDER BY streams_range;
10. #Identify the artist with the highest number of songs
SELECT 
    track_name,
    `artist(s)_name` AS popular_artists,
	 streams  AS popular_songs
FROM spotify
ORDER BY popular_songs DESC
LIMIT 1; 
