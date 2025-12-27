#!/bin/bash


code=$(zenity --entry \
  --title="Unicode Input" \
  --text="input unicode (2665 | 2190-2193 | 1F600)" \
  --width=400)

if [ -z "$code" ]; then
  exit 0
fi

code=$(echo "$code" | tr -d '[:space:]' | tr '[:upper:]' '[:lower:]')


if ! [[ $code =~ ^[0-9a-f]{1,6}$ ]]; then
  zenity --error --text="incorrect hex!" --title="Error"
  exit 1
fi


printf "\\U$(printf "%08x" 0x$code)" | wl-copy

