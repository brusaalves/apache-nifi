#!/usr/bin/env bash

case $1 in
'init') init;;
'props') apply_properties;;
*) echo "Opcao Invalida!" ;;
esac

init() {
    apply_properties
}

apply_properties() {
    cat ${NIFI_HOME}/conf/custom/nifi.properties > ${NIFI_HOME}/conf/nifi.properties
}