#!/bin/bash

$token=_your_bot_token_
group_a=number_here
group_b=number_here

if [ $4 == "group_a" ]; then
	chat=$group_a
else
	chat=$group_b
fi

host=$2
data=$3
if [ $1 == "RECOVERY" ]; then
	emoji=`jq -r . <<<'"\u2705"'`
else
	emoji=`jq -r . <<<'"\ud83d\udd25"'`
fi

text="$emoji $host $data"
curl -k -L --data chat_id=-$chat --data-urlencode "text=$text" "https://api.telegram.org/bot$token/sendMessage"
