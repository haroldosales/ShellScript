#!/usr/bin/env bash

find / -iname "*.so" \
       -user mateus  \
       -type f       \
       -size +1M     \
       -exec ls {}   \;
