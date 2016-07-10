#!/bin/bash
source ./validations.sh
echo "this script will give you the mean value"
echo " when finish entering the values, press Q"
index=0
escape="Q"
finish=1
while [ $finish -ne 0 ]
do
    echo " enter a number "
    read number
    checks $number $escape
    want_exit=$?
    require_number $number please_a_number 2
    if [ $? -eq 0 ]
    then
        numbers[$index]=$number
    elif [ $want_exit -eq 0 ]
    then
        finish=0
    else
        echo " that wasn't a number so it wasn't count"
        echo # give a space for better understanding
    fi
done
