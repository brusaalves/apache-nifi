ARG IMAGE
FROM ${IMAGE}

USER root

COPY sh/start.sh /opt/nifi/scripts/
RUN chmod +x /opt/nifi/scripts/start.sh

USER nifi