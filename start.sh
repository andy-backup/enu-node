SNAPSHOT_FOLDER=./data/snapshots
SNAPSHOT_FILE=$(ls $SNAPSHOT_FOLDER -t | head -1)

rm -rf ./data/blocks ./data/state ./data/snapshots/*
URL=https://github.com/andy-backup/enu/raw/master/snapshot.bin
wget $URL -P $SNAPSHOT_FOLDER

./enunode --data-dir ./data --config-dir ./config --snapshot $SNAPSHOT_FOLDER/$SNAPSHOT_FILE