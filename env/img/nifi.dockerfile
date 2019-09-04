ARG IMAGE
FROM ${IMAGE}

COPY app/src/conf/nifi.properties /opt/nifi/nifi-current/conf/nifi.properties