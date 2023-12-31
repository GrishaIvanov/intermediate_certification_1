
--Создаем исходные таблицы 

CREATE TABLE if not exists austin_bikeshare_trips (

    bikeid numeric,

    checkout_time time,

    duration_minutes smallint,

    end_station_id numeric,

    end_station_name varchar(255),

    month numeric,

    start_station_id numeric,

    start_station_name varchar(255),

    start_time timestamp,

    subscriber_type varchar(255),

    trip_id numeric primary key,

    year numeric 
);

CREATE TABLE if not exists austin_bikeshare_stations(

    latitude numeric(7,5),

    location varchar(255),

    longitude numeric(7,5),

    name varchar(255),

    station_id numeric,

    status varchar(255)
);

--Импортируем данные из CSV:

COPY public.stations
FROM '/docker-entrypoint-initdb.d/austin_bikeshare_stations.csv'
CSV HEADER;

/*Формируем таблицы с заданным содержанием для заданных годов:

    уникальный идентификатор станции

    количество начавшихся поездок в данной станции за данных год

    количество завершенных поездок в данной станции за данных год

    общее количество поездок начавшихся или закончившихся в данной станции за данных год

    средняя продолжительность поездок начавшихся в данной станции в данном году

    средняя продолжительность поездок завершившихся в данной станции в данном году*/

CREATE TABLE year_2013 AS
SELECT 
    start_station_id AS station_id,
    COUNT(DISTINCT trip_id) AS started_trips,
    0 AS ended_trips,
    COUNT(DISTINCT trip_id) AS total_trips,
    AVG(duration_minutes) AS avg_started_trip_duration,
    0 AS avg_ended_trip_duration
FROM austin_bikeshare_trips
JOIN austin_bikeshare_stations ON austin_bikeshare_trips.start_station_id = austin_bikeshare_stations.station_id
WHERE status = 'active' AND EXTRACT(YEAR FROM start_time) = 2013
GROUP BY start_station_id;

CREATE TABLE year_2014 AS
SELECT 
    start_station_id AS station_id,
    COUNT(DISTINCT trip_id) AS started_trips,
    0 AS ended_trips,
    COUNT(DISTINCT trip_id) AS total_trips,
    AVG(duration_minutes) AS avg_started_trip_duration,
    0 AS avg_ended_trip_duration
FROM austin_bikeshare_trips
JOIN austin_bikeshare_stations ON austin_bikeshare_trips.start_station_id = austin_bikeshare_stations.station_id
WHERE status = 'active' AND EXTRACT(YEAR FROM start_time) = 2014
GROUP BY start_station_id;

CREATE TABLE year_2015 AS
SELECT 
    start_station_id AS station_id,
    COUNT(DISTINCT trip_id) AS started_trips,
    0 AS ended_trips,
    COUNT(DISTINCT trip_id) AS total_trips,
    AVG(duration_minutes) AS avg_started_trip_duration,
    0 AS avg_ended_trip_duration
FROM austin_bikeshare_trips
JOIN austin_bikeshare_stations ON austin_bikeshare_trips.start_station_id = austin_bikeshare_stations.station_id
WHERE status = 'active' AND EXTRACT(YEAR FROM start_time) = 2015
GROUP BY start_station_id;

CREATE TABLE year_2016 AS
SELECT 
    start_station_id AS station_id,
    COUNT(DISTINCT trip_id) AS started_trips,
    0 AS ended_trips,
    COUNT(DISTINCT trip_id) AS total_trips,
    AVG(duration_minutes) AS avg_started_trip_duration,
    0 AS avg_ended_trip_duration
FROM austin_bikeshare_trips
JOIN austin_bikeshare_stations ON austin_bikeshare_trips.start_station_id = austin_bikeshare_stations.station_id
WHERE status = 'active' AND EXTRACT(YEAR FROM start_time) = 2016
GROUP BY start_station_id;

CREATE TABLE year_2017 AS
SELECT 
    start_station_id AS station_id,
    COUNT(DISTINCT trip_id) AS started_trips,
    0 AS ended_trips,
    COUNT(DISTINCT trip_id) AS total_trips,
    AVG(duration_minutes) AS avg_started_trip_duration,
    0 AS avg_ended_trip_duration
FROM austin_bikeshare_trips
JOIN austin_bikeshare_stations ON austin_bikeshare_trips.start_station_id = austin_bikeshare_stations.station_id
WHERE status = 'active' AND EXTRACT(YEAR FROM start_time) = 2017
GROUP BY start_station_id;
