#!/bin/bash

NUMBER1=100
NUMBER2=200

TIMESTAMP=$(date + %s)

echo "Script Executed at:: $TIMESTAMP"

SUM=$(($NUMBER1+$NUMBER2))
echo "Sum of $NUMBER1 and $NUMBER2 is: $SUM"
