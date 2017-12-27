#!/bin/bash
#SBATCH -J Step4a          # job name
#SBATCH -o Step4a.o%j       # output and error file name (%j expands to jobID)
#SBATCH -N 1               # total number of Nodes requested
#SBATCH -n 1              # total number of mpi tasks requested 607 to run
#SBATCH -p normal     # queue (partition) -- normal, development, etc.
#SBATCH -t 48:00:00        # run time (hh:mm:ss) - 1.5 hours
#SBATCH --mail-user=alice.macqueen@utexas.edu
#SBATCH --mail-type=begin  # email me when the job starts
#SBATCH --mail-type=end    # email me when the job finishes
#SBATCH -A Genomics-of-salt-tol	# project I will charge this time to (Also have Genomics-of-salt-tol with an allocation)

$WORK/bin/jdk1.8.0_144/jre/bin/java -Xms1G -Xmx15G -jar $WORK/bin/NGSEPcore_3.1.0/NGSEPcore_3.0.2.jar MergeVCF $HOME/Pvulgaris_G19833/assembly/Pvulgaris_G19833_mainGenome_seqnames.txt $SCRATCH/6b_NGSEP_ind_vcfs/CDBN_318/*HiQ_NGSEP.vcf 1> $SCRATCH/7_NGSEP_pop_vcf/CDBN_Best_Ind_pop_v2.vcf 2> $SCRATCH/7_NGSEP_pop_vcf/CDBN_Best_Ind_pop_v2.log
