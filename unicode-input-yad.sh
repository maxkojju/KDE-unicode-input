#!/usr/bin/env bash

code=$(yad --entry \
    --title="input unicode (2665 | 2190-2193 | 1F600)" \
    --width=500 \
    --height=80 \
    --center \
    --no-buttons \
    --timeout=0 \
    --entry-text="2665" \
    --sticky)


[[ -z "$code" ]] && exit 0


code=$(tr -d '[:space:]' <<< "$code" | tr '[:upper:]' '[:lower:]')


[[ $code =~ ^[0-9a-f]{1,6}$ ]] || exit 1


printf "\\U$(printf "%08x" 0x$code)" | wl-copy
