#!/bin/bash

error(){
	printf "\033[35mError:\t\033[31m${1}!\033[0m\n"
	exit 1
}

compile_program(){
	progname="${1}"
	if [ -e "${progname}.groovy" ];
	then
		printf "\033[36mCompiling, \033[33m${progname}.groovy\033[0m\n"
		groovyc "${progname}".groovy && \
		printf "\033[32mDone\033[0m\n" || \
		error "Unable to compile ${progname}.groovy"
	else
		error "Unable to find ${progname}.groovy"
	fi
}

run_program(){
	progname="${1}"
	if [ ! -z "${progname}" ];
	then 
		[ -e "${progname}.class" ] && \
		java -cp .:groovy-3.0.5.jar "${progname%.class}" || \
		error "Unable to find class file ${progname}"
	else
		error "Program name was not set"
	fi
}

remove_classes(){
	if [ ! -z "`find . -type f -name *.class`" ];
	then
		for f in `find . -type f -name *.class`
		do
			printf "\033[36mRemoving \033[33m${f}\033[0m\n"
			rm -fv ${f}
		done
	else
		printf "\033[35mInfo:\t\033[32mNo classes were found.\033[0m\n"
	fi
}

help_menu(){
	printf "\033[36mEZ Groovy Wrapper\033[0m\n"
	printf "PARAMETERS:\n"
	printf "\033[35mSet Action:\t\033[33m--action\033[0m\n"
	printf "\033[35mSet Filename:\t\033[33m--filename\033[0m\n"
	printf "\nACTIONS:\n"
	printf "\033[35mCompile Program\t\033[32m[ build, compile ]\033[0m\n"
	printf "\033[35mTest Program\t\033[32m[ run, test ]\033[0m\n"
	printf "\033[35mRemove Program\t\033[32m[ remove, flush ]\033[0m\n"
	printf "\nUSAGE:\n"
	printf "\033[35m$0 \033[33m--action=\033[32mcompile\033[0m \033[33m--filename=\033[32mmyprogname\033[0m\n"
	printf "\033[35m$0 \033[33m--action=\033[32mremove\n\n"
	exit 0
}

for args in "${@}"
do
	case $args in
		--action=*) _action=$(echo "$args" | cut -d'=' -f2);;
		--filename=*) _filename=$(echo "$args" | cut -d'=' -f2)
		if [ -z "${_filename}" ];
		then 
			error "Missing filename"
		fi
		;;
		-h|-help|--help) help_menu;;
	esac
done

case $_action in
	build|compile) compile_program "${_filename%.groovy}";;
	run|test) run_program "${_filename%.class}";;
	remove|flush) remove_classes;;
	*) error "Missing or invalid parameter was entered";;
esac


