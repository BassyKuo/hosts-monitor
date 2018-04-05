#!/bin/sh
echo $@
if [ "$1" = '-m' ] ; then commit=$2; shift; shift; fi

