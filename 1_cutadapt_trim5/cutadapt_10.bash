#!/bin/bash
#SBATCH -J ctadpt_10	# job name
#SBATCH -o cutadapt_10_%j		# output and error file name (%j expands to jobID)
#SBATCH -n 1			# total number of mpi tasks requested
#SBATCH -p normal		# queue (partition) -- normal, development, largemem(x4), etc.
#SBATCH -t 48:00:00		# run time (hh:mm:ss) - 15 hours
#SBATCH -A Genomics-of-salt-tol	# project I will charge this time to (Also have Genomics-of-salt-tol with an allocation)
#SBATCH --mail-user=alice.macqueen@utexas.edu
#SBATCH --mail-type=all		# email me when the job starts, ends, or has an error


$HOME/.local/bin/cutadapt -g file:$SCRATCH/cutadapt_barcode_fasta/plate10_barcodes.fasta -e 0.2 --no-indels --untrimmed-o $SCRATCH/unmatched_cutadapt/untrimmed10.fastq.gz -o $SCRATCH/cutadapt_trim5/bctrim5_{name}.fastq.gz $SCRATCH/plate10/IIXC_GBS_CDGN1_NONE_NA_I709_L1_R1.fastq 
