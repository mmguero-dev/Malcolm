FROM amazon/opendistro-for-elasticsearch-kibana:1.11.0

# Copyright (c) 2020 Battelle Energy Alliance, LLC.  All rights reserved.
LABEL maintainer="malcolm.netsec@gmail.com"
LABEL org.opencontainers.image.authors='malcolm.netsec@gmail.com'
LABEL org.opencontainers.image.url='https://github.com/idaholab/Malcolm'
LABEL org.opencontainers.image.documentation='https://github.com/idaholab/Malcolm/blob/master/README.md'
LABEL org.opencontainers.image.source='https://github.com/idaholab/Malcolm'
LABEL org.opencontainers.image.vendor='Idaho National Laboratory'
LABEL org.opencontainers.image.title='malcolmnetsec/kibana-od'
LABEL org.opencontainers.image.description='Malcolm container providing Kibana (the Apache-licensed Open Distro variant)'

ARG DEFAULT_UID=1000
ARG DEFAULT_GID=1000
ENV DEFAULT_UID $DEFAULT_UID
ENV DEFAULT_GID $DEFAULT_GID
ENV PUSER "kibana"
ENV PGROUP "kibana"
ENV PUSER_PRIV_DROP true

ENV TERM xterm

ARG ELASTICSEARCH_URL="http://elasticsearch:9200"
ARG KIBANA_DEFAULT_DASHBOARD="0ad3d7c2-3441-485e-9dfe-dbb22e84e576"

ENV ELASTICSEARCH_URL $ELASTICSEARCH_URL
ENV KIBANA_DEFAULT_DASHBOARD $KIBANA_DEFAULT_DASHBOARD

USER root

# TODO:
# see https://github.com/uniberg/kbn_sankey_vis/issues/15#issuecomment-720700879
# curl -sSL -o /tmp/kibana-sankey.zip "https://codeload.github.com/mmguero-dev/kbn_sankey_vis/zip/master" && \
# cd /tmp && \
#   echo "Installing Sankey visualization..." && \
#   unzip /tmp/kibana-sankey.zip && \
#   mkdir ./kibana &&\
#   mv ./kbn_sankey_vis-* ./kibana/sankey_vis && \
#   cd ./kibana/sankey_vis && \
#   sed -i "s/7\.6\.3/7\.9\.1/g" ./package.json && \
#   npm install && \
#   cd /tmp && \
#   zip -r sankey_vis.zip kibana --exclude ./kibana/sankey_vis/.git\* && \
#   cd /usr/share/kibana/plugins && \
#   /usr/share/kibana/bin/kibana-plugin install file:///tmp/sankey_vis.zip --allow-root && \
#   rm -rf /tmp/kibana /tmp/*sankey* && \

RUN yum install -y epel-release && \
      yum update -y && \
      yum install -y curl npm patch psmisc zip unzip && \
      yum clean all && \
      usermod -a -G tty ${PUSER} && \
    cd /tmp && \
      # Malcolm manages authentication and encryption via NGINX reverse proxy
      /usr/share/kibana/bin/kibana-plugin remove opendistro_security --allow-root && \
    curl -sSL -o /tmp/kibana-drilldown.zip "https://codeload.github.com/mmguero-dev/kibana-plugin-drilldownmenu/zip/master" && \
    cd /tmp && \
      echo "Installing Drilldown menu plugin..." && \
      unzip /tmp/kibana-drilldown.zip && \
      mkdir ./kibana &&\
      mv ./kibana-plugin-drilldownmenu-* ./kibana/kibana-plugin-drilldownmenu && \
      cd ./kibana/kibana-plugin-drilldownmenu && \
      sed -i "s/7\.6\.2/7\.9\.1/g" ./package.json && \
      npm install && \
      cd /tmp && \
      zip -r drilldown.zip kibana --exclude ./kibana/kibana-plugin-drilldownmenu/.git\* && \
      cd /usr/share/kibana/plugins && \
      /usr/share/kibana/bin/kibana-plugin install file:///tmp/drilldown.zip --allow-root && \
      rm -rf /tmp/kibana /tmp/*drilldown* && \
    cd /tmp && \
      rm -rf /tmp/npm-*

ADD kibana/kibana.yml /usr/share/kibana/config/kibana.yml

USER $DEFAULT_UID

EXPOSE 5601

# to be populated at build-time:
ARG BUILD_DATE
ARG MALCOLM_VERSION
ARG VCS_REVISION

LABEL org.opencontainers.image.created=$BUILD_DATE
LABEL org.opencontainers.image.version=$MALCOLM_VERSION
LABEL org.opencontainers.image.revision=$VCS_REVISION
