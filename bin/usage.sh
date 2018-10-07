#!/bin/bash

##
## This script should print the message:
## "The script <script_name> has received the argument <argument>"
## Note the special variables $0 and $1 contain precisely this information
## Take advantage of string interpolation and the command "echo" to print the message
##
## ==================================================================================
##
## SAMPLE RUN
##
## ./usage.sh ACTG
## "The script usage.sh has received the argument ACTG"
##
## ==================================================================================

if [ "$1" = "" ]; then
  echo "The script $0 has not received any argument" 
else
  counter=0
  while [ $counter -lt 5 ]; do
      echo "The script $0 has received the argument $1"
      let counter=counter+1
  done 
fi
