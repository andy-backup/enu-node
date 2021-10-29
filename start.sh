#!/bin/bash
set -e

SNAPSHOT_FILE=./snapshot.bin

if [ ! $SNAPSHOT_URL ]; then  
  SNAPSHOT_URL=https://github.com/andy-backup/enu/raw/master/snapshot.bin
fi

if [ "$PRODUCER_API_ENABLE" = "true" ]; then
  echo "plugin = enumivo::producer_api_plugin" >> ./config/config.ini
fi

if [ "$PRODUCER_ENABLE" = "true" ]; then
  echo "plugin = enumivo::producer_plugin" >> ./config/config.ini
  echo "producer-name = $PRODUCER_NAME" >>  ./config/config.ini
  echo "signature-provider=$PUBLIC_KEY=KEY:$PRIVATE_KEY" >>  ./config/config.ini
fi

rm -rf ./data

wget $SNAPSHOT_URL -O $SNAPSHOT_FILE

./enunode --data-dir ./data --config-dir ./config --snapshot $SNAPSHOT_FILE