FROM python:3.8.6-slim
MAINTAINER Amane Katagiri
WORKDIR /data
CMD [""]
ENTRYPOINT ["/app/deploy.sh"]
RUN mkdir -p /usr/share/man/man1 \
    && apt update \
    && apt install -y --no-install-recommends sudo curl git ssh make openjdk-11-jre openjdk-11-jre-headless ca-certificates-java imagemagick \
    && rm -rf /var/lib/apt/lists/* \
    && curl -L -o /usr/bin/firebase https://firebase.tools/bin/linux/latest \
    && chmod +x /usr/bin/firebase
COPY ./deploy.sh /app/deploy.sh
