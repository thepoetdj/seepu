#!/bin/bash

# capture cpu & memory usage statistics
STATS_TEMP_FILE=/tmp/seepu.stats
STATS=$(sar -r 1 1 -o $STATS_TEMP_FILE &> 1 && sadf $STATS_TEMP_FILE -j -- -u -r | jq -c '.sysstat')
: '
The sar output is stored in a temporary file,
and unless it is removed,
historical statistics will also be included in the resulting JSON.
'
rm -f $STATS_TEMP_FILE
# log the formatted JSON
echo $STATS | tee -a $STATS_LOG_FILE