#!/bin/bash
# add_read_groups_CDBN - Author parameter file for bwa mem filtered and trimmed fastq files.

# Check for required arguments
if [[ -z $1 ]] | [[ -z $2 ]] | [[ -z $3 ]]; then
    echo "usage: make-RG-param.sh </sorted-bam-input-path/> </output-path/> </path/to/metadata-file>"
    exit 1;
fi

# Declare variables
INDIR=$1	#/scratch/04022/macqueen/4_bwa_mem/
ODIR=$2		# /scratch/04022/macqueen/5_Add_RG/
PARAM=$3 	#/scratch/04022/macqueen/5_Add_RG/Tassel_metadata2.txt
OFIL="Add_RG.param"
LOG="logs/"
SCRIPT="/scratch/04022/macqueen/"

if [ -e $OFIL ]; then rm $OFIL; fi
touch $OFIL




input=$1
name=`echo $PARAM | sed s/-qc.sort.bam//g`

INFIL=`grep -w $name $PARAM | cut -f11 -d$'\t'`
#RGPL=`grep -w $name $PARAM | cut -f10 -d$'\t'`
RGID=`grep -w $name $PARAM | cut -f2 -d$'\t'`
RGLB=`grep -w $name $PARAM | cut -f8 -d$'\t'`
RGPU=`grep -w $name $PARAM | cut -f6 -d$'\t'`
RGSM=`grep -w $name $PARAM | cut -f7 -d$'\t'`

echo -n "java -Xms1G -Xmx2G -jar /opt/apps/picard/1.98/AddOrReplaceReadGroups.jar I=$INFIL O=${ODIR}${RGSM}_RG_added.sort.bam RGID=$RGID RGLB=$RGLB RGPL=illumina RGPU=$RGPU RGSM=$RGSM" >> $OFIL

