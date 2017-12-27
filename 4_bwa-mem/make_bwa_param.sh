#!/bin/bash
# make-bwa-param.sh - Author parameter file for bwa mem filtered and trimmed fastq files.

# Check for required arguments
if [[ -z $1 ]] | [[ -z $2 ]]; then
    echo "usage: make-qr-param.sh </filtered-fastq-input-path/> </output-path/> "
    exit 1;
fi

# Declare variables
INDIR=$1
ODIR=$2
PARAM="BWA-MEM-File.param"
LOG="logs/"
SCRIPT="/scratch/04022/macqueen/"

if [ -e $PARAM ]; then rm $PARAM; fi
touch $PARAM

# For most cases where you have your filtered/trimmed reads in one directory like
# /data/filtered-reads/
for fil in ${INDIR}*; do
    BASE=$(basename $fil)
    NAME=${BASE%.fastq}
    OFILS="${ODIR}${NAME}.sam"
	OFILB="${ODIR}${NAME}.bam"
	OFILSB="${ODIR}${NAME}.sort.bam"
    echo "bwa mem $HOME/Pvulgaris_G19833/assembly/Pvulgaris_G19833_mainGenome.fa $fil > $OFILS; samtools view -bt $HOME/Pvulgaris_G19833/assembly/Pvulgaris_G19833_mainGenome.fa.fai $OFILS > $OFILB; samtools sort $OFILB $OFILSB; rm ${OFILB}" >> $PARAM
done

# echo "samtools view -bt $HOME/Pvulgaris_G19833/assembly/Pvulgaris_G19833_mainGenome.fa.fai $OFILS > $OFILB" >> $PARAM
#  echo "samtools sort $OFILB $OFILSB" >> $PARAM
# echo "rm ${OFILB}" >> $PARAM
