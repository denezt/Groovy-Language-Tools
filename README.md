# Groovy
Project for Groovy Language


## Using the Wrapper 

### This wrapper is a tool for working with Groovy.
1. Compile a Groovy Script to Java.
2. Running the program after it has compiled.
3. Remove older session _(i.e. myprogram.class files)_


``` sh
EZ Groovy Wrapper
PARAMETERS:
Set Action:	--action
Set Filename:	--filename

ACTIONS:
Compile Program	[ build, compile ]
Test Program	[ run, test ]
Remove Program	[ remove, flush ]

USAGE:
./wrapper.sh --action=compile --filename=myprogname
./wrapper.sh --action=remove
```
