FROM bitnami/postgresql

COPY words.sql /docker-entrypoint-initdb.d/words.sql
ENV ALLOW_EMPTY_PASSWORD=yes
ENV PGPASSPOSTGRESQL_PASSWORD=s3cr3t
#ENV POSTGRES_HOST_AUTH_METHOD=trust