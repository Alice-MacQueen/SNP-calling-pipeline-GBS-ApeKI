#!/bin/bash
#SBATCH -J ctdpt_09	# job name
#SBATCH -o ctdpt_09_%j		# output and error file name (%j expands to jobID)
#SBATCH -n 1			# total number of mpi tasks requested
#SBATCH -p normal		# queue (partition) -- normal, development, largemem(x4), etc.
#SBATCH -t 48:00:00		# run time (hh:mm:ss) - 15 hours
#SBATCH -A Genomics-of-salt-tol	# project I will charge this time to (Also have Genomics-of-salt-tol with an allocation)
#SBATCH --mail-user=alice.macqueen@utexas.edu
#SBATCH --mail-type=all		# email me when the job starts, ends, or has an error


$HOME/.local/bin/cutadapt -g file:$SCRATCH/cutadapt_barcode_fasta/plate9_all_barcodes.fasta -e 0.2 --no-indels --untrimmed-o $SCRATCH/unmatched_cutadapt/untrimmed09.fastq.gz -o $SCRATCH/cutadapt_trim5/bctrim5_{name}.fastq.gz $SCRATCH/plate09/ICBP_GBS_GBS9_NONE_NA_I371_L2_R1.fastq 
