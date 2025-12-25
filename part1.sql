USE DATA_CLEANING_SPOTIFY;

SELECT * FROM SPOTIFY_2023;
ALTER TABLE SPOTIFY_2023 ADD ID INT PRIMARY KEY AUTO_INCREMENT;
SELECT 
sum(case when track_name is null then 1 else 0 end)as track_name,
sum(case when released_year is null then 1 else 0 end)as released_month,
sum(case when released_month is null then 1 else 0 end)as released_month,
sum(case when in_spotify_playlists  is null then 1 else 0 end)as spotify_playlists,
sum(case when in_spotify_charts is null then 1 else 0 end)as spotify_charts,
sum(case when streams is null then 1 else 0 end)as streams,
sum(case when bpm is null then 1 else 0 end)as bpm,
sum(case when danceability is null then 1 else 0 end)as danceability,
sum(case when valence is null then 1 else 0 end)as valence,
sum(case when energy is null then 1 else 0 end)as energy,
sum(case when acousticness is null then 1 else 0 end)as acousticness,
sum(case when instrumentalness is null then 1 else 0 end)as instrumentalness,
sum(case when liveness is null then 1 else 0 end)as liveness,
sum(case when speechiness is null then 1 else 0 end)as speechiness
from spotify_2023;

select track_name,released_year,released_month,in_spotify_playlists,in_spotify_charts,bpm
,danceability,energy,speechiness,acousticness,instrumentalness,liveness,valence,streams,
count(*) as duplicate_count
from spotify_2023
group by track_name,released_year,released_month,in_spotify_playlists,in_spotify_charts,bpm,
danceability,energy,speechiness,acousticness,instrumentalness,liveness,valence,streams
having duplicate_count > 0;

delete s1
from spotify_2023 as s1
inner join spotify_2023 as s2
on s1.id > s2.id
and s1.track_name = s2.track_name
and s1.released_year = s2.released_year
and s1.released_month = s2.released_month
and s1.in_spotify_playlists = s2.in_spotify_playlists
and s1.in_spotify_charts = s2.in_spotify_charts
and s1.bpm  = s2.bpm
and s1.danceability = s2.danceability
and s1.energy = s2.energy
and s1.speechiness = s2.speechiness
and s1.acousticness = s2.acousticness
and s1.instrumentalness =  s2.instrumentalness
and s1.liveness = s2.liveness
and s1.valence = s2.valence
and s1.streams= s2.streams
;

#STANDARIZED TEXT
SELECT LOWER(TRACK_NAME) AS TRACK_NAME
FROM SPOTIFY_2023;

#CHECKING WHETHER VALUES IN THE NUMERICAL RANGE

SELECT BPM,danceability , ENERGY
FROM SPOTIFY_2023
WHERE BPM NOT BETWEEN 40 AND 250 
   OR danceability NOT BETWEEN 0 AND 100 
   OR energy NOT BETWEEN 0 AND 100;


# OUTLINER DATA
SELECT MAX(bpm), MIN(bpm) FROM spotify_2023;
SELECT MAX(streams), MIN(streams) FROM spotify_2023;


#FORMATING THE CONSISTENCY

SELECT DISTINCT released_month
FROM spotify_2023
WHERE released_month < 1 OR released_month > 12;
SELECT DISTINCT released_year
FROM spotify_2023
WHERE released_year < 1900 OR released_year > YEAR(CURDATE());

#Descriptive Statistics (Overview of Data)
SELECT COUNT(TRACK_NAME) AS TOTAL_SONG, COUNT(RELEASED_YEAR) AS YEAR FROM SPOTIFY_2023;

SELECT AVG(STREAMS) AS AVG_STREAM, AVG(BPM) AS AVG_BPM , AVG(DANCEABILITY) AS AVG_DANCEABILITY FROM SPOTIFY_2023;

SELECT MAX(RELEASED_YEAR) AS LATEST_RELEASE FROM SPOTIFY_2023;

#TREND ANALYSIS

SELECT RELEASED_YEAR,
AVG(STREAMS) AS AVG_STREAM
FROM SPOTIFY_2023
WHERE RELEASED_YEAR IS NOT NULL
GROUP BY RELEASED_YEAR
ORDER BY RELEASED_YEAR DESC;

SELECT RELEASED_MONTH,AVG(STREAMS) AS AVG_STREAM
FROM SPOTIFY_2023
WHERE RELEASED_MONTH IS NOT NULL
GROUP BY RELEASED_MONTH 
ORDER BY RELEASED_MONTH DESC;

# POPULAR INSGITS

SELECT TRACK_NAME
FROM SPOTIFY_2023
WHERE IN_SPOTIFY_PLAYLISTS =
(
SELECT MAX(IN_SPOTIFY_PLAYLISTS)
FROM SPOTIFY_2023
);

SELECT TRACK_NAME 
FROM SPOTIFY_2023
ORDER BY TRACK_NAME DESC
LIMIT 10;

# FEATURE RELATIONSHIP
SELECT 
  CASE 
    WHEN danceability >= 50 THEN 'High Danceability'
    ELSE 'Low Danceability'
  END AS Danceability_Level,
  (SELECT AVG(streams) 
   FROM spotify_2023 s2 
   WHERE (s2.danceability >= 50 AND danceability >= 50) 
      OR (s2.danceability < 50 AND danceability < 50)
  ) AS Avg_Streams
FROM spotify_2023
GROUP BY Danceability_Level;

SELECT 
  CASE 
    WHEN ENERGY >= 50 THEN 'High ENERGY'
    ELSE 'Low ENERGY'
  END AS ENERGY_LEVEL,
  (SELECT AVG(streams) 
   FROM spotify_2023 s2 
   WHERE (s2.ENERGY >= 50 AND ENERGY >= 50) 
      OR (s2.ENERGY < 50 AND ENERGY < 50)
  ) AS AVG_ENERGY
FROM spotify_2023
GROUP BY ENERGY_LEVEL;
