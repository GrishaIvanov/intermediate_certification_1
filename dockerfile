FROM postgres:latest

ENV POSTGRES_DB trips
ENV PGUSER postgres
ENV POSTGRES_PASSWORD password

VOLUME bikes_trips:/var/lib/postgressql/bikes_trips

EXPOSE 5432