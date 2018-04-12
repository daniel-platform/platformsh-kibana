#!/bin/bash

KIBANA_VERSION=6.2.3

KIBANA_DOWNLOAD_URI="https://artifacts.elastic.co/downloads/kibana"
KIBANA_DL_ARCHIVE="kibana-${KIBANA_VERSION}-linux-x86_64.tar.gz"

# Make directories
mkdir -p ${PLATFORM_APP_DIR}/kibana;

# Download and Extract Kibana
echo "Downloading ${KIBANA_DOWNLOAD_URI}/${KIBANA_DL_ARCHIVE}"
tar xzv -C ${PLATFORM_APP_DIR}/kibana --strip 1 < <(wget --no-cookies --no-check-certificate -q -O - ${KIBANA_DOWNLOAD_URI}/${KIBANA_DL_ARCHIVE})

# Remove default config and symlink it to actual
rm -f ${PLATFORM_APP_DIR}/kibana/config/kibana.yml
ln -s ${PLATFORM_APP_DIR}/config/kibana_config.yml ${PLATFORM_APP_DIR}/kibana/config/kibana.yml

