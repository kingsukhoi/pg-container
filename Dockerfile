FROM docker.io/library/postgres:16-bookworm
RUN apt update && apt install -y gnupg postgresql-common apt-transport-https lsb-release wget
RUN echo "deb https://packagecloud.io/timescale/timescaledb/debian/ $(lsb_release -c -s) main" | tee /etc/apt/sources.list.d/timescaledb.list
RUN wget --quiet -O - https://packagecloud.io/timescale/timescaledb/gpgkey | gpg --dearmor -o /etc/apt/trusted.gpg.d/timescaledb.gpg

RUN apt update && apt install -y timescaledb-2-postgresql-16 postgresql-client-16
RUN apt remove -y gnupg lsb-release wget
