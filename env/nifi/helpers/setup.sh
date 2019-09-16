#!/usr/bin/env bash

apply_properties() {
    cp ${NIFI_HOME}/conf/custom/nifi.properties ${NIFI_HOME}/conf/test.properties
}

apply_properties