FROM ghcr.io/paperless-ngx/paperless-ngx:latest
RUN useradd --home-dir /home/container --create-home --non-unique --uid 1000 --gid 1000 container && userdel paperless

USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]