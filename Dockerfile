FROM python:3.13-slim
LABEL maintainer="Amane Katagiri"
WORKDIR /data
CMD [""]
ENTRYPOINT ["/app/deploy.sh"]
RUN mkdir -p /usr/share/man/man1 \
    && apt update \
    && apt install -y --no-install-recommends sudo curl git ssh make openjdk-21-jre openjdk-21-jre-headless ca-certificates-java imagemagick libimage-exiftool-perl zip golang \
    && curl -fsSL https://deb.nodesource.com/setup_22.x | bash - \
    && apt install -y nodejs \
    && rm -rf /var/lib/apt/lists/* \
    && curl -SsL -o /usr/bin/firebase https://firebase.tools/bin/linux/latest \
    && chmod +x /usr/bin/firebase
COPY ./deploy.sh /app/deploy.sh
