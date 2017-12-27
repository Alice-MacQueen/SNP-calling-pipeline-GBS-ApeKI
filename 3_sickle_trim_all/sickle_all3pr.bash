#!/bin/bash
#SBATCH -J sickle	# job name
#SBATCH -o sickle_%j		# output and error file name (%j expands to jobID)
#SBATCH -n 1			# total number of mpi tasks requested
#SBATCH -p normal		# queue (partition) -- normal, development, largemem(x4), etc.
#SBATCH -t 2:00:00		# run time (hh:mm:ss) - 15 hours
#SBATCH -A Genomics-of-salt-tol	# project I will charge this time to (Also have Genomics-of-salt-tol with an allocation)
#SBATCH --mail-user=alice.macqueen@utexas.edu
#SBATCH --mail-type=all		# email me when the job starts, ends, or has an error

module add sickle

for i in $SCRATCH/cutadapt_trim3_all/all3pr_trim_*.fastq.gz
do
  OUTPUT=$(echo ${i} | sed "s/cutadapt_trim3_all\/all3pr_trim/sickle_trim_all\/sickle_all3pr/" | sed "s/\.fastq\.gz//")
  sickle se -f ${i} -t sanger -l 36 -o ${OUTPUT}.fastq
done

