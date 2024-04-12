#!/bin/bash

STATS_TEMP_FILE=/tmp/seepu.stats
# fetch memory usage statistics
STATS=$(sar -r 1 1 -o $STATS_TEMP_FILE &> 1 && sadf $STATS_TEMP_FILE -j -- -u -r | jq -c '.sysstat')
# remove temporary file
rm -f $STATS_TEMP_FILE
# output formatted JSON for consumption
echo $STATS >> ${STATS_DIR:-/var/log}/seepu.log