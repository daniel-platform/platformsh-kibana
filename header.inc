#!/bin/sh

export KIBANA_HOME=${PLATFORM_APP_DIR}/kibana
export IP_ADDRESS=$(getent hosts $(hostname) | awk '{ print $1 }')
