#!/bin/bash

if ! command -v jq &> /dev/null
then
    echo "jq could not be found, please install it to run this script."
    exit
fi

if [ $# -eq 0 ]
then
    echo "Usage: $0 <cookie_value>"
    exit 1
fi

USER_INPUT="$1"

response=$(curl --silent --request POST \
  --url 'https://join.pokemon.com/sute-vpon-he-grate-againearst-thee-Birty-prinke-?d=join.pokemon.com' \
  --data "\"$USER_INPUT\"")

renewInSec=$(echo $response | jq '.renewInSec')

if [ $renewInSec -gt 0 ]
then
    echo "Cookie is valid for $renewInSec seconds."
else
    echo "Cookie is invalid."
fi
