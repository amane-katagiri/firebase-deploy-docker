FROM python:3.13-slim
LABEL maintainer="Amane Katagiri"
WORKDIR /data
CMD [""]
ENTRYPOINT ["/app/deploy.sh"]
RUN mkdir -p /usr/share/man/man1 \
    && apt update \
    && apt install -y --no-install-recommends sudo curl git ssh make openjdk-17-jre openjdk-17-jre-headless ca-certificates-java imagemagick zip golang \
    && rm -rf /var/lib/apt/lists/* \
    && curl -SsL https://github.com/CloudCannon/pagefind/releases/download/v1.4.0/pagefind_extended-v1.4.0-x86_64-unknown-linux-musl.tar.gz | gzip -d | tar x \
    && mv pagefind_extended /usr/bin/pagefind \
    && curl -SsL -o /usr/bin/firebase https://firebase.tools/bin/linux/latest \
    && chmod +x /usr/bin/firebase
COPY ./deploy.sh /app/deploy.sh
