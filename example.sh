#!/bin/sh
echo "hello world!"
test -n "$1" && echo 'I was passed' $1
