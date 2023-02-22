#!/bin/bash

# Global regular expression ###########################################################################################

REGEX="\b"
REGEX=$REGEX"(2[0-2][0-3]|1[0-9][0-9]|[1-9][0-9]|[1-9])" # 1st byte
REGEX=$REGEX"\."
REGEX=$REGEX"(2[0-5][0-5]|1[0-9][0-9]|[1-9][0-9]|[0-9])" # 2nd byte
REGEX=$REGEX"\."
REGEX=$REGEX"(2[0-5][0-5]|1[0-9][0-9]|[1-9][0-9]|[0-9])" # 3rd byte
REGEX=$REGEX"\."
REGEX=$REGEX"(2[0-5][0-4]|1[0-9][0-9]|[1-9][0-9]|[1-9])" # 4th byte
REGEX=$REGEX"\b"

# Functions ###########################################################################################################

error() {
	echo "Error: $1" >&2
	exit $2
}

check() {
	( echo .|grep -P . >/dev/null 2>&1 ) || error "'$(which grep)' seems to not support PCRE (-P)." 255
}

# Match ###############################################################################################################

true|check # ignore pipe

grep -P "$REGEX" $* # get pipe if specified

