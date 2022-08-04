#!/usr/bin/env bash

#If you would like to add a wrapper script where you supply your downloaded tsv from the s__ from gtdb
#Find a method to append to a file when something has worked, since this will lead to easier flows

#input variables
fin=$1
id=$2

#01_download_fnas.sh*
./01_download_fnas.sh $fin ../results/fnas

#02_run_prodigal.sh*
./02_run_prodigal.sh ../results/fnas/ ../results/faas/

#03_run_pangenome.sh*
./03_run_pangenome.sh ../results/faas/ ../results/pan

#04_uniquegenes.R
Rscript 04_uniquegenes.R ../results/pan/pangenome.tsv $id ../results/uniquegenes.tsv

