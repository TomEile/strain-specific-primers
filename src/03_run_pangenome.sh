#!/usr/bin/env bash
# dependency: scarap


#variables change how many threads you want to use
threads=32

#input variables based on in and output
din=$1
dout=$2

gunzip $din*.gz
scarap pan $din $dout -t $threads 
gzip $din*.faa
