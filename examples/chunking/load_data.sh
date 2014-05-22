#! /usr/bin/env bash

export DBNAME=deepdive_chunking
export PGUSER=${PGUSER:-`whoami`}
export PGPASSWORD=${PGPASSWORD:-}

APP_HOME=`pwd`

psql -c "copy word_raw(id, word, pos, tag) from '$APP_HOME/data/word_raw.csv' with csv;" $DBNAME
psql -c "copy words(id, raw_id, word, pos, tag_true, tag, val) from '$APP_HOME/data/words.csv' with csv;" $DBNAME
psql -c "copy word_features(id, word_id, feature) from '$APP_HOME/data/word_features.csv' with csv;" $DBNAME