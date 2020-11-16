FROM amazon/opendistro-for-elasticsearch:1.11.0

# Copyright (c) 2020 Battelle Energy Alliance, LLC.  All rights reserved.
LABEL maintainer="malcolm.netsec@gmail.com"
LABEL org.opencontainers.image.authors='malcolm.netsec@gmail.com'
LABEL org.opencontainers.image.url='https://github.com/idaholab/Malcolm'
LABEL org.opencontainers.image.documentation='https://github.com/idaholab/Malcolm/blob/master/README.md'
LABEL org.opencontainers.image.source='https://github.com/idaholab/Malcolm'
LABEL org.opencontainers.image.vendor='Idaho National Laboratory'
LABEL org.opencontainers.image.title='malcolmnetsec/elasticsearch-od'
LABEL org.opencontainers.image.description='Malcolm container providing Elasticsearch (the Apache-licensed Open Distro variant)'

ARG DEFAULT_UID=1000
ARG DEFAULT_GID=1000
ENV DEFAULT_UID $DEFAULT_UID
ENV DEFAULT_GID $DEFAULT_GID
ENV PUSER "elasticsearch"
ENV PGROUP "elasticsearch"
ENV PUSER_PRIV_DROP true

ENV TERM xterm

ARG GITHUB_OAUTH_TOKEN=""
ARG DISABLE_INSTALL_DEMO_CONFIG=true
ENV DISABLE_INSTALL_DEMO_CONFIG $DISABLE_INSTALL_DEMO_CONFIG

# Malcolm manages authentication and encryption via NGINX reverse proxy
# https://opendistro.github.io/for-elasticsearch-docs/docs/security/configuration/disable/
# https://opendistro.github.io/for-elasticsearch-docs/docs/install/docker/#customize-the-docker-image
RUN /usr/share/elasticsearch/bin/elasticsearch-plugin remove opendistro_security && \
  cd /tmp && \
  # https://github.com/opendistro-for-elasticsearch/alerting/issues/292
      curl -f -s -S -L -o /tmp/opendistro-anomaly-detection-1.11.0.0.zip "https://github.com/opendistro-for-elasticsearch/alerting/files/5490651/opendistro-anomaly-detection-1.11.0.0.zip" && \
      [ -r /tmp/opendistro-anomaly-detection-1.11.0.0.zip ] && for once in "your life"; do \
        /usr/share/elasticsearch/bin/elasticsearch-plugin remove opendistro-anomaly-detection && \
        /usr/share/elasticsearch/bin/elasticsearch-plugin install --batch "file:///tmp/opendistro-anomaly-detection-1.11.0.0.zip"; \
        rm -f /tmp/opendistro-anomaly-detection-1.11.0.0.zip; \
    done; \
    [ ${#GITHUB_OAUTH_TOKEN} -gt 1 ] && \
      curl -f -s -S -L -o /tmp/alerting-plugin.zip -H "Authorization: token $GITHUB_OAUTH_TOKEN" "https://api.github.com/repos/opendistro-for-elasticsearch/alerting/actions/artifacts/23667246/zip" && \
      [ -r /tmp/alerting-plugin.zip ] && \
      unzip /tmp/alerting-plugin.zip && \
      [ -r /tmp/opendistro_alerting-1.11.0.1-SNAPSHOT.zip ] && for once in "your life"; do \
        /usr/share/elasticsearch/bin/elasticsearch-plugin remove opendistro_alerting && \
        /usr/share/elasticsearch/bin/elasticsearch-plugin install --batch "file:///tmp/opendistro_alerting-1.11.0.1-SNAPSHOT.zip"; \
        rm -f /tmp/alerting-plugin.zip /tmp/opendistro_alerting-1.11.0.1-SNAPSHOT.zip; \
    done; \
    echo -e 'cluster.name: "docker-cluster"\nnetwork.host: 0.0.0.0' > /usr/share/elasticsearch/config/elasticsearch.yml && \
    chown -R $PUSER:$PGROUP /usr/share/elasticsearch/config/elasticsearch.yml

# to be populated at build-time:
ARG BUILD_DATE
ARG MALCOLM_VERSION
ARG VCS_REVISION

LABEL org.opencontainers.image.created=$BUILD_DATE
LABEL org.opencontainers.image.version=$MALCOLM_VERSION
LABEL org.opencontainers.image.revision=$VCS_REVISION
