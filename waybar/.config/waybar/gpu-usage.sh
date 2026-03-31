#!/usr/bin/env bash

usage=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits 2>/dev/null | head -n1)

if [[ -z "$usage" ]]; then
  echo '{"text":"-","tooltip":"GPU unavailable","class":"offline","percentage":0}'
  exit 0
fi


echo "{\"text\":\"${usage}%\",\"tooltip\":\"GPU usage: ${usage}%\",\"class\":\"offline\",\"percentage\":${usage}}"
