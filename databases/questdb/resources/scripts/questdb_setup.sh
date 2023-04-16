#!/bin/sh
address=$1
create_table_query=$(cat /resources/init.sql)
echo $address
echo $create_table_query
curl -G  --data-urlencode "query=$create_table_query;" http://$address/exec