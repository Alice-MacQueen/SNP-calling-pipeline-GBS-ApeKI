#!/bin/bash
#SBATCH -J bwa_200s	# job name
#SBATCH -o bwa_200s_%j		# output and error file name (%j expands to jobID)
#SBATCH -n 1			# total number of mpi tasks requested
#SBATCH -p normal		# queue (partition) -- normal, development, largemem(x4), etc.
#SBATCH -t 48:00:00		# run time (hh:mm:ss) - 48 hours
#SBATCH -A Genomics-of-salt-tol	# project I will charge this time to (Also have Genomics-of-salt-tol with an allocation)
#SBATCH --mail-user=alice.macqueen@utexas.edu
#SBATCH --mail-type=all		# email me when the job starts, ends, or has an error

module add samtools
module add bwa

for i in $SCRATCH/sickle_trim_all/sickle_all3pr_CDBN_2*.fastq
do
  OUTPUT=$(echo ${i} | sed "s/sickle_trim_all\/sickle_all3pr/4_bwa_mem\/align/" | sed "s/\.fastq//")
  bwa mem $HOME/Pvulgaris_G19833/assembly/Pvulgaris_G19833_mainGenome.fa ${i} > ${OUTPUT}.sam
  samtools view -bt $HOME/Pvulgaris_G19833/assembly/Pvulgaris_G19833_mainGenome.fa.fai ${OUTPUT}.sam > ${OUTPUT}.bam
  samtools sort ${OUTPUT}.bam ${OUTPUT}.sort
  rm ${OUTPUT}.sam
  rm ${OUTPUT}.bam
done