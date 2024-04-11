#!/bin/bash

STATS_TEMP_FILE="cpu-stats"
# fetch memory usage statistics
STATS=$(sar -r 1 1 -o $STATS_TEMP_FILE &> 1 && sadf $STATS_TEMP_FILE -j --iface=eth1 -- -u -r -n DEV | jq -c '.sysstat')
# remove temporary file
rm -f $STATS_TEMP_FILE

# output formatted JSON for consumption
echo '{"topic":"'"${TOPIC:-cpu-stats}"'","event":'"$STATS"'}' >> ${STATS_DIR:-/var/log}/seepu.json