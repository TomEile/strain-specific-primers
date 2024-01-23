# strain-specific-primers
## Pipeline to make strain specific primers for your strain of interest
If you intend to add your own strains together with the downloaded ones, add 
your samples in the correct folder before step 2.

## Wrapper script
To check how the pipeline works, you can use the wrapper script ./src/wrapper
run in ./src: ./wrapper.sh ../data/s__Lactiplantibacillus_pentosus.tsv 
GCF_001188985.1 
If you would like to add your own genome not on gtdb, add this after step one
in the correct folder.


## Dependencies
SCARAP version 0.4.0: https://github.com/SWittouck/SCARAP
Prodigal V2.6.3: https://github.com/hyattpd/Prodigal
Rpackage: tidyverse 1.3.1 https://www.tidyverse.org/

## 01_download_fnas.sh
Download the tsv of the gtdb (https://gtdb.ecogenomic.org/) with your specific species/genus (select GTDB taxonomy field and use the s__ or the g__-prefix), this tsv is the 
input for the first script

Script copied from 
https://github.com/SWittouck/proclasp/tree/master/scripts/download_fnas.sh with
permission. This script will download all genomes based on your gtdblist.tsv

01_download_fnas.sh gtdb.tsv outputfolder

## 02_run_prodigal.sh
This script will run prodigal on all your fna files to gather faa for scarap

02_run_prodigal.sh folder_previous_step outputfolder

## 03_run_pangenome.sh
This script will make a pangenome of your supplied genomes, input is the output
from previous step

03_run_pangenome.sh folder_prevous_step outputfolder

## 04_uniquegenes.R
Script to select unique genes from the pangenome. Here, you need input from
previous folder (pangenome.tsv), your GCA identifier from GTDB (or another
unique identifier if you would use on your own non-published genomes), and
optionally an outputfile, standard it will be saved in ../results/uniquegenes.tsv

04_uniquegenes pangenomes.tsv_in_folder_previous_step GCA_unique_identifier
 (optionally outputfile)
