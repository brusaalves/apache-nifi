ARG NIFI_VERSION=1.4.0
ARG NIFI_IMAGE_TAG=1.4.0

FROM apache/nifi:${NIFI_IMAGE_TAG}
LABEL maintener 'Bruno Alves <brunosalves3@gmail.com>'

ENV NIFI_VERSION=${NIFI_VERSION}

# RUN cd /opt/nifi/nifi-$(NIFI_VERSION) \
#     mkdir lib-custom
