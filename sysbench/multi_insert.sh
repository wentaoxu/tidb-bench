#!/bin/bash

set -x

. ./conf.sh

sysbench --test=./lua-tests/db/lock_cf_expand/multi_insert.lua --db-driver=${driver} --mysql-host=${host} --mysql-port=${port} \
 --mysql-user=${user} --mysql-password=${password} --mysql-db=${dbname} \
 --oltp-tables-count=${tcount} --oltp-table-size=${tsize} \
 --num-threads=${threads} --oltp_multi_inserts={oltp_multi_inserts} --report-interval=${interval} \
 --max-requests=${requests} --percentile=95 --max-time=${maxtime} run
