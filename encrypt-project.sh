#!/bin/bash 

PATHTO_PROJECT=$1;
pass=$2
PROJECT_NAME=$(echo "${PATHTO_PROJECT}" | awk -F/ '{ print $NF }');

printf "\n-------------------\nCREATING ENCRYPTED PROJECT AT /tmp/$PROJECT_NAME.enc\n"
mkdir "/tmp/${PROJECT_NAME}.enc";
printf "CREATED ENCRYPTED PROJECT AT /tmp/$PROJECT_NAME.enc\n\n"
printf "CREATING ENCRYPTED PROJECT SKELETON AT /tmp/$PROJECT_NAME.enc\n\n"
find $PATHTO_PROJECT -type d -exec mkdir -p "/tmp/${PROJECT_NAME}.enc"/{}

find $PATHTO_PROJECT -type f  -exec openssl aes-256-cbc -a -k $pass -salt -in ${file} -out "${path}/${file}.enc"