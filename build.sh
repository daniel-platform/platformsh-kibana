#!/bin/bash

KIBANA_VERSION=6.2.3

KIBANA_DOWNLOAD_URI="https://artifacts.elastic.co/downloads/kibana/"
KIBANA_DL_ARCHIVE="kibana-${KIBANA_VERSION}-linux-x86_64.tar.gz"

# Make directories
mkdir -p ${PLATFORM_APP_DIR}/kibana;

# Download and Extract Kibana
echo "Downloading"
tar xzv -C ${PLATFORM_APP_DIR}/kibana --strip 1 < <(wget --no-cookies --no-check-certificate -q -O - ${KIBANA_DOWNLOAD_URI}/${KIBANA_DL_ARCHIVE})

# Apply Platform.sh Patches
#OLD_DIR=`pwd`
#cd ${PLATFORM_APP_DIR}
#for PATCH_FILE in ${PLATFORM_APP_DIR}/patches/*.patch; do    
#    patch -p0 < $PATCH_FILE
#done

