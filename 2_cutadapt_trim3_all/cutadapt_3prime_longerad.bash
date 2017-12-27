#!/bin/bash
#SBATCH -J 3pr_cutadapt	# job name
#SBATCH -o cutadapt_3pr_longeradapter_%j		# output and error file name (%j expands to jobID)
#SBATCH -n 1			# total number of mpi tasks requested
#SBATCH -p normal		# queue (partition) -- normal, development, largemem(x4), etc.
#SBATCH -t 24:00:00		# run time (hh:mm:ss) - 24 hours
#SBATCH -A Genomics-of-salt-tol	# project I will charge this time to (Also have Genomics-of-salt-tol with an allocation)
#SBATCH --mail-user=alice.macqueen@utexas.edu
#SBATCH --mail-type=all		# email me when the job starts, ends, or has an error


for i in $SCRATCH/cutadapt_trim5/bctrim5_*.fastq.gz
do
  OUTPUT=$(echo ${i} | sed "s/trim5\/bctrim5/trim3_all\/all3pr_trim/" | sed "s/\.fastq\.gz//")
  $HOME/.local/bin/cutadapt -a TTGAGATCGGAAGAGCGGTTCAGCAGGAATGCCGAG -o ${OUTPUT}.fastq.gz ${i}
done

