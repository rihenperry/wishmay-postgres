  FROM postgres:12 as wishmay-postgres
  MAINTAINER Rihan Pereira <rihp05@gmail.com>

  ARG POSTGRES_USER
  ARG POSTGRES_PASSWORD
  ARG WISHMAY_USER
  ARG WISHMAY_USER_PWD
  ARG WISHMAY_DB

  ENV PG_MAJOR 12
  ENV POSTGRES_USER ${POSTGRES_USER}
  ENV POSTGRES_PASSWORD ${POSTGRES_PASSWORD}
  ENV WISHMAY_USER ${WISHMAY_USER}
  ENV WISHMAY_USER_PWD ${WISHMAY_USER_PWD}
  ENV WISHMAY_DB ${WISHMAY_DB}

  RUN echo 'deb http://apt.postgresql.org/pub/repos/apt/ buster-pgdg main' $PG_MAJOR > /etc/apt/sources.list.d/pgdg.list

  RUN apt-get update \
  && apt-get install -y --no-install-recommends postgresql-client-$PG_MAJOR \
  && rm -rf /var/lib/apt/lists/*

  ADD ./scripts/init-user-db.sh /docker-entrypoint-initdb.d/
