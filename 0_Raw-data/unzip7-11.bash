#!/bin/bash
#SBATCH -J unzip10-11	# job name
#SBATCH -o unzip10-11%j		# output and error file name (%j expands to jobID)
#SBATCH -n 1			# total number of mpi tasks requested
#SBATCH -p normal		# queue (partition) -- normal, development, largemem(x4), etc.
#SBATCH -t 3:00:00		# run time (hh:mm:ss) - 3 hours
#SBATCH -A Genomics-of-salt-tol	# project I will charge this time to (Also have Genomics-of-salt-tol with an allocation)
#SBATCH --mail-user=alice.macqueen@utexas.edu
#SBATCH --mail-type=all		# email me when the job starts, ends, or has an error


bzip2 -dk /scratch/04022/macqueen/plate10/IIXC_GBS_CDGN1_NONE_NA_I709_L1_R1.fastq.bz2
#bzip2 -dk /scratch/04022/macqueen/plate11/IIXD_GBS_CDGN2_NONE_NA_I709_L2_R1.fastq.bz2
