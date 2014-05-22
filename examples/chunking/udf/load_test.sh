#! /usr/bin/env bash

psql -c "copy words(word, pos, true_tag) from '$APP_HOME/data/test_null_terminated.txt' delimiter ' ' null 'null';" $DBNAME