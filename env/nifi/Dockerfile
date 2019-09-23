ARG IMAGE
FROM ${IMAGE}

USER root
RUN mkdir -p /opt/nifi/scripts/custom && \
    chmod 777 -R /opt/nifi/scripts/custom
COPY res/scripts/*.sh /opt/nifi/scripts/custom
RUN chmod +x /opt/nifi/scripts/custom/helpers.sh

USER nifi
ENTRYPOINT ../scripts/custom/helpers.sh init && ../scripts/start.sh