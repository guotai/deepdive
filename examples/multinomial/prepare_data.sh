
export DBNAME=multinomial
dropdb $DBNAME
createdb $DBNAME

psql $DBNAME < schema.sql
