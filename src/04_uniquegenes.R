#Dependency: tidyverse
library(tidyverse)

args= commandArgs(trailingOnly=TRUE)
if (length(args)<2) {
	  stop("Not enough arguments found, please supply input location(1), strain identifier (GCA identifier) (2) and optionally output file(3) ", call.=FALSE)
} else if (length(args)==2) {
	  # default output file
	  args[3]="../results/uniquegenes.tsv"
}
pangenome <- read.delim(args[1], header=FALSE)


#Select unique genes from pangenome
unique_genes<-pangenome %>% 
	  count(V3) %>% 
	    filter(n<2)
    specific_primers<-pangenome %>% 
	      filter(V3 %in%unique_genes$V3) %>% 
	        filter(str_detect(V2,args[2]))

write.table(specific_primers,file=args[3],col.names = FALSE,row.names = FALSE)
sprintf("table written on location: %s",args[3])
