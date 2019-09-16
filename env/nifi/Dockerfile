ARG IMAGE
FROM ${IMAGE}

USER root
COPY helpers /opt/nifi/nifi-current/helpers
RUN chmod 777 -R /opt/nifi/nifi-current/helpers && \
    chmod +x /opt/nifi/nifi-current/helpers/setup.sh
COPY nifi.properties /opt/nifi/nifi-current/conf/nifi.properties
# USER nifi

# CMD ./opt/nifi/nifi-current/helpers/setup.sh