SNAPSHOT_FOLDER=./data/snapshots
SNAPSHOT_FILE=$(ls $SNAPSHOT_FOLDER -t | head -1)

rm -rf ./data/blocks ./data/state

find $SNAPSHOT_FOLDER/* -mtime +30
find $SNAPSHOT_FOLDER/* -mtime +30 -delete

./enunode --data-dir ./data --config-dir ./config --snapshot $SNAPSHOT_FOLDER/$SNAPSHOT_FILE