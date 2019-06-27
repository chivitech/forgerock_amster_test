#!/bin/bash

# ./idm-reg-email-sent-report.sh 2019-06-26 2019-06-27

for var in "$@"
do
  echo "$var"
  VALIDATED=$(grep $var access.csv | grep 'SUCCESSFUL' | grep 'validateObject' | wc -l)
  VALIDATED2=$(grep $var access2.csv | grep 'SUCCESSFUL' | grep 'validateObject' | wc -l)

  SENT=$(grep $var access.csv | grep 'SUCCESSFUL' | grep 'submitRequirements' | grep 'send' |  grep 'selfservice/registration' | wc -l)
  SENT2=$(grep $var access2.csv | grep 'SUCCESSFUL' | grep 'submitRequirements' | grep 'send' | grep 'selfservice/registration' | wc -l)

  TOTAL_VALIDATED=$(($VALIDATED + $VALIDATED2))
  TOTAL_SENT=$(($SENT + $SENT2))

  echo "Emails successfully validated: $TOTAL_VALIDATED"
  echo "Emails successfully sent: $TOTAL_SENT"
done
