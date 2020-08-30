#!/bin/bash

progname="${1}"

error(){
	printf "\033[35mError:\t\033[31m${1}\033[0m\n"
	exit 1
}

if [ ! -z "${progname}" ];
then
	while :
	do
		groovy "${progname}"
		sleep 1
	done
else
	error "Missing or invalid filename was given."
fi
