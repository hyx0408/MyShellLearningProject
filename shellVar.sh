#!/bin/bash
#This is about Variables.
echo "To see all system variables, type one of the following commands at a console/terminal:"
echo "(1)set (2)env (3)printenv"
echo set outputs:
echo -e `set | less -N | grep HOSTNAME`
echo env outputs:
echo -e `env | less -N | grep HOSTNAME`
echo printenv outputs:
echo -e `printenv | less -N | grep HOSTNAME`

