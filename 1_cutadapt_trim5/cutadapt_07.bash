#!/bin/bash
#SBATCH -J ctadpt_7	# job name
#SBATCH -o ctadapt_07_%j		# output and error file name (%j expands to jobID)
#SBATCH -n 1			# total number of mpi tasks requested
#SBATCH -p normal		# queue (partition) -- normal, development, largemem(x4), etc.
#SBATCH -t 48:00:00		# run time (hh:mm:ss) - 15 hours
#SBATCH -A Genomics-of-salt-tol	# project I will charge this time to (Also have Genomics-of-salt-tol with an allocation)
#SBATCH --mail-user=alice.macqueen@utexas.edu
#SBATCH --mail-type=all		# email me when the job starts, ends, or has an error


$HOME/.local/bin/cutadapt -g file:$SCRATCH/cutadapt_barcode_fasta/plate7_all_barcodes.fasta -e 0.2 --no-indels --untrimmed-o $SCRATCH/unmatched_cutadapt/untrimmed07.fastq.gz -o $SCRATCH/cutadapt_trim5/bctrim5_{name}.fastq.gz $SCRATCH/plate07/ICBM_GBS_GBS7_NONE_NA_I370_L2_R1.fastq 

