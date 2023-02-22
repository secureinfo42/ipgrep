#!/bin/sh

REGEX="\b(2[0-2][0-3]|1[0-9][0-9]|[1-9][0-9]|[0-9])\.(2[0-5][0-5]|1[0-9][0-9]|[1-9]?[0-9])\.(2[0-5][0-5]|1[0-9][0-9]|[1-9][0-9]|[0-9])\.(2[0-5][0-4]|1[0-9][0-9]|[1-9][0-9]|[1-9])\b"

grep -P "$REGEX" $*
