FROM ghcr.io/paperless-ngx/paperless-ngx:latest
RUN useradd --home-dir /home/container --create-home --non-unique --uid 1000 --gid 1000 container

RUN sed -i 's;logfile=/var/log/supervisord/supervisord.log;logfile=/home/container/supervisord/supervisord.log;g' /etc/supervisord.conf
RUN sed -i 's;pidfile=/var/log/supervisord/supervisord.pid;pidfile=/home/container/supervisord/supervisord.pid;g' /etc/supervisord.conf
RUN sed -i 's;user=root;user=container;g' /etc/supervisord.conf
RUN sed -i 's;user=paperless;;g' /etc/supervisord.conf
RUN sed -i 's;environment = HOME="/usr/src/paperless",USER="paperless";environment = HOME="/home/container",USER="container";g' /etc/supervisord.conf

USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT []

CMD ["/bin/bash", "/entrypoint.sh"]