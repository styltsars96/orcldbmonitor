#!/usr/bin/env bash

#SQL*Plus code here
get_db_res()
{
sqlplus / as sysdba << EOF
	set echo off
	set verify off
	set feedback off
	@dbmon_1
	
EOF
}

print_all()
{
echo '-------------------------------------------------------------------------------------------------'
echo 'CPU & IO stats ----------------------------------------------------------------------------------'
iostat #cpu and I/O from system
echo 'Database ----------------------------------------------------------------------------------------'
get_db_res #results from DB queries
echo '-------------------------------------------------------------------------------------------------'
}

monitor()
{
print_all | grep -Ev '^(SQL| |Copyright|Connected to|Oracle Database|truncating|rows will be truncated)' | sed '/^\s*$/d'
}

iterations=0
int_time=$1
total_time=$2

#checks if the given arguements are fewer than 2
if [ "$#" -lt "2" ]
then
	echo "Wrong number of arguements."
	echo "Give arguements: [time between intervals] [total running time in seconds]"
	exit
fi
#Checks if arguements are correct
n="$#"
for (( i=1 ; i<=n ; i++ ))
do
	input=$(echo $@ | cut -d \  -f $i) #gets the i-th arguement
	if  [ "$input" -le "0" ]
	then
		echo "Please provide positive integers!"
		exit
	fi
done

echo "Beginning..."
monitor
((iterations=total_time/int_time))
for ((i=1 ; i<=iterations ; i++))
do
	echo "iteration $i"
	sleep $int_time
	monitor
done

