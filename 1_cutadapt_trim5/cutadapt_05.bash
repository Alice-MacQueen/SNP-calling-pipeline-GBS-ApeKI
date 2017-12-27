#!/bin/bash
#SBATCH -J ctadpt_5	# job name
#SBATCH -o ctadpt_5_%j		# output and error file name (%j expands to jobID)
#SBATCH -n 1			# total number of mpi tasks requested
#SBATCH -p normal		# queue (partition) -- normal, development, largemem(x4), etc.
#SBATCH -t 48:00:00		# run time (hh:mm:ss) - 15 hours
#SBATCH -A Genomics-of-salt-tol	# project I will charge this time to (Also have Genomics-of-salt-tol with an allocation)
#SBATCH --mail-user=alice.macqueen@utexas.edu
#SBATCH --mail-type=all		# email me when the job starts, ends, or has an error


$HOME/.local/bin/cutadapt -g file:$SCRATCH/cutadapt_barcode_fasta/plate5_all_barcodes.fasta -e 0.2 --no-indels --untrimmed-o $SCRATCH/unmatched_cutadapt/untrimmed05.fastq.gz -o $SCRATCH/cutadapt_trim5/bctrim5_{name}.fastq.gz $SCRATCH/plate05/IBUS_GBS_NDSUGBS5_McClean_GBS5_I346_L2_R1.fastq 
