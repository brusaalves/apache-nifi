ARG NIFI_VERSION=1.7.1

FROM apache/nifi:${NIFI_VERSION}
LABEL maintener 'Bruno Alves <brunosalves3@gmail.com>'

RUN mkdir -p $NIFI_HOME/lib/custom && \
    ln -s $NIFI_HOME/lib/custom $NIFI_BASE_DIR/custom-libs && \
    echo "\n\nnifi.nar.library.directory.lib1=$NIFI_BASE_DIR/custom-libs" >> $NIFI_HOME/conf/nifi.properties
