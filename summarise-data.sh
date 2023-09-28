#! /bin/bash

QUERY1='select date(entrydate_start) as day, count(*) as number_of_outages, sum(entry_duration_minutes) / 60 as total_duration_h, avg(entry_duration_minutes) / 60 as avg_duration_h from outage_entries group by date(entrydate_start);'
QUERY2='select date(entrydate_start) as day, count(*) as number_of_outages, sum(entry_duration_minutes) / 60 as total_duration_h, avg(entry_duration_minutes) / 60 as avg_duration_h from outage_entries where entryoperator_name LIKE "Pfalzwerke%" group by date(entrydate_start);'

sqlite3 -column -header outages.sqlite <<< ${QUERY1} > all-outages.txt
sqlite3 -column -header outages.sqlite <<< ${QUERY2} > pfalzwerke-outages.txt
