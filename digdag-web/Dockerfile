FROM openjdk:8-jdk-slim

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

RUN apt-get update && apt-get install -y \
  curl gettext-base postgresql-client \
  && rm -rf /var/lib/apt/lists/*

# Installin docker client
# ENV DOCKER_CLIENT_VERSION=1.12.6 \
#     DOCKER_API_VERSION=1.24
# RUN curl -fsSL https://get.docker.com/builds/Linux/x86_64/docker-${DOCKER_CLIENT_VERSION}.tgz \
#   | tar -xzC /usr/local/bin --strip=1 docker/docker

# Installing digdag server
RUN curl -o /usr/local/bin/digdag --create-dirs -L "https://dl.digdag.io/digdag-latest" && \
  chmod +x /usr/local/bin/digdag

# Environment variable for default setting
ENV POSTGRES_USER=digdag_master \
    POSTGRES_PASSWORD=ddDev001 \
    POSTGRES_HOST=postgresql \
    POSTGRES_PORT=5432 \
    POSTGRES_DB=digdag \
    LOG_TYPE=local \
    ENCRYPTION_KEY=MDEyMzQ1Njc4OTAxMjM0NQ==

COPY entrypoint.sh /usr/local/bin
COPY server.properties.tmpl /etc/digdag/server.properties.tmpl
RUN chmod +x /usr/local/bin/entrypoint.sh

# ENTRYPOINT ["sleep","5000"]
# ENTRYPOINT ["/usr/local/bin/digdag","server", "--memory"]

# 2つ目の引数が反映されないので
ENTRYPOINT ["/usr/local/bin/entrypoint.sh","a","/usr/local/bin/digdag","server","--config","/etc/digdag/server.properties"]