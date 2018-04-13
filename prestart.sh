#!/bin/sh

# Load header
. ./header.inc

# Extract database configuration from enviroment
#export KIBANA_ES_PORT=$(bin/json_env PLATFORM_RELATIONSHIPS billinges.elasticsearch.port)
#export KIBANA_ES_HOST=$(bin/json_env PLATFORM_RELATIONSHIPS billinges.elasticsearch.host)
#export KIBANA_ES_SCHEME=$(bin/json_env PLATFORM_RELATIONSHIPS billinges.elasticsearch.scheme)
export KIBANA_ES_PORT=$(bin/json_env PLATFORM_RELATIONSHIPS billinges.billinges.port)
export KIBANA_ES_HOST=$(bin/json_env PLATFORM_RELATIONSHIPS billinges.billinges.host)
export KIBANA_ES_SCHEME=$(bin/json_env PLATFORM_RELATIONSHIPS billinges.billinges.scheme)
export KIBANA_ES_URL="${KIBANA_ES_SCHEME}://${KIBANA_ES_HOST}:${KIBANA_ES_PORT}"

echo "Generating Configuration..."

# Generate a databse configuration
cat << EOF > ${PLATFORM_APP_DIR}/config/kibana_config.yml
elasticsearch.url: ${KIBANA_ES_URL}
path.data: ${KIBANA_HOME}/data
pid.file: ${PLATFORM_APP_DIR}/temp/kibana.pid
server.port: ${PORT}
logging.verbose: true
EOF

