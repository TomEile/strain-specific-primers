#!/usr/bin/env bash

fin=$1
dout=$2

[ -d $dout ] || mkdir -p $dout

for F in $fin*.fna.gz;
	do N=$(basename $F .fna.gz);
		gunzip $F
	T=${F::-3}
prodigal -i $T -a $dout/$N.faa -q >/dev/null;
gzip $T
gzip $dout/$N.faa
done
