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

# Making the API call using curl
response=$(curl -s 'https://api.join.pokemon.com/validate-user-fields' -X PUT \
-H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:127.0) Gecko/20100101 Firefox/127.0' \
-H 'Accept: application/json, text/plain, */*' \
-H 'Accept-Language: en-US' \
-H 'Accept-Encoding: gzip, deflate, br, zstd' \
-H 'Content-Type: application/json;charset=utf-8' \
-H 'x-datadog-origin: rum' \
-H 'x-datadog-parent-id: 7539390486347769262' \
-H 'x-datadog-sampling-priority: 1' \
-H 'x-datadog-trace-id: 8193530928205858171' \
-H 'Origin: https://join.pokemon.com' \
-H 'Connection: keep-alive' \
-H 'Referer: https://join.pokemon.com/' \
-H "Cookie: reese84=$USER_INPUT" \
-H 'Sec-Fetch-Dest: empty' \
-H 'Sec-Fetch-Mode: cors' \
-H 'Sec-Fersite: same-site' \
-H 'TE: trailers')

if [ "$response" == '{ "message": "access denied", "statusCode": "403", "type": "ACCESS_DENIED" }' ]; then
    echo "REESE OK"
else
    echo "BAD REESE"
fi
