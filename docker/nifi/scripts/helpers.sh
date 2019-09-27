#!/usr/bin/env bash

main() {
    apply_properties
}

apply_properties() {
    cat ${NIFI_HOME}/conf/custom/nifi.properties > ${NIFI_HOME}/conf/nifi.properties
}

case $1 in
    'init') main;;
    'props') apply_properties;;
    *) echo "Opcao Invalida!";;
esac