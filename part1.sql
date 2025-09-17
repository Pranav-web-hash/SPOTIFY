USE DATA_CLEANING_SPOTIFY;

SELECT * FROM  SPOTIFY_2023;

SELECT 
sum(case when track_name is null then 1 else 0 end)as track_name,
sum(case when artist_name is null then 1 else 0 end)as artist_name,
sum(case when artist_count  is null then 1 else 0 end)as artist_count,
sum(case when released_year is null then 1 else 0 end)as released_month,
sum(case when released_month is null then 1 else 0 end)as released_month,
sum(case when released_day is null then 1 else 0 end)as released_day,
sum(case when in_spotify_playlists  is null then 1 else 0 end)as spotify_playlists,
sum(case when in_spotify_charts is null then 1 else 0 end)as spotify_charts,
sum(case when streams is null then 1 else 0 end)as streams,
sum(case when in_apple_playlists is null then 1 else 0 end)as apple_playlists,
sum(case when in_apple_charts is null then 1 else 0 end)as apple_charts,
sum(case when in_deezer_playlists is null then 1 else 0 end)as deezer_playlist,
sum(case when in_deezer_charts is null then 1 else 0 end)as deezer_charts,
sum(case when in_shazam_charts is null then 1 else 0 end)as shazam_count,
sum(case when bpm is null then 1 else 0 end)as bpm,
sum(case when key1 is null then 1 else 0 end)as key1,
sum(case when mode1 is null then 1 else 0 end)as mode1,
sum(case when danceability is null then 1 else 0 end)as danceability,
sum(case when valence is null then 1 else 0 end)as valence,
sum(case when energy is null then 1 else 0 end)as energy,
sum(case when acousticness is null then 1 else 0 end)as acousticness,
sum(case when instrumentalness is null then 1 else 0 end)as instrumentalness,
sum(case when liveness is null then 1 else 0 end)as liveness,
sum(case when speechiness is null then 1 else 0 end)as speechiness
from spotify_2023;

select track_name,artist_name,artist_count,released_year,released_month,released_day,in_spotify_playlists,in_spotify_charts,in_apple_playlists,in_apple_charts,in_deezer_playlists,in_deezer_charts,in_shazam_charts,bpm,key1,mode1
,danceability,energy,speechiness,acousticness,instrumentalness,liveness,valence,streams,
count(*) as duplicate_count
from spotify_2023
group by track_name,artist_name,artist_count,released_year,released_month,released_day,in_spotify_playlists,in_spotify_charts,in_apple_playlists,in_apple_charts,in_deezer_playlists,in_deezer_charts,in_shazam_charts,bpm,
key1,mode1,danceability,energy,speechiness,acousticness,instrumentalness,liveness,valence,streams
having duplicate_count > 0;

delete s1
from spotify_2023 as s1
inner join spotify_2023 as s2
on s1.id > s2.id
and s1.track_name = s2.track_name
and s1.artist_name=s2.artist_name
and s1.artist_count=s2.artist_count
and s1.released_year = s2.released_year
and s1.released_month = s2.released_month
and s1.released_day = s2.released_day
and s1.in_spotify_playlists = s2.in_spotify_playlists
and s1.in_spotify_charts = s2.in_spotify_charts
and s1.in_apple_playlists = s2.in_apple_playlists
and s1.in_apple_charts = s2.in_apple_charts
and s1.in_deezer_playlists= s2.in_deezer_playlists
and s1.in_deezer_charts = s2.in_shazam_charts;


