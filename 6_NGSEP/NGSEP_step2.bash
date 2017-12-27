#!/bin/bash
#SBATCH -J Step2           # job name
#SBATCH -o Step2.o%j       # output and error file name (%j expands to jobID)
#SBATCH -N 1               # total number of Nodes requested
#SBATCH -n 1              # total number of mpi tasks requested 607 to run
#SBATCH -p normal     # queue (partition) -- normal, development, etc.
#SBATCH -t 24:00:00        # run time (hh:mm:ss) - 1.5 hours
#SBATCH --mail-user=alice.macqueen@utexas.edu
#SBATCH --mail-type=begin  # email me when the job starts
#SBATCH --mail-type=end    # email me when the job finishes
#SBATCH -A Genomics-of-salt-tol	# project I will charge this time to (Also have Genomics-of-salt-tol with an allocation)

$WORK/bin/jdk1.8.0_144/jre/bin/java -Xms1G -Xmx8G -jar $WORK/bin/NGSEPcore_3.1.0/NGSEPcore_3.0.2.jar MergeVariants $HOME/Pvulgaris_G19833/assembly/Pvulgaris_G19833_mainGenome_seqnames.txt $SCRATCH/6c_NGSEP_variants_list/CDBN_variants_list.vcf $SCRATCH/6b_NGSEP_ind_vcfs/CDBN*.*vcf >& $SCRATCH/6c_NGSEP_variants_list/CDBN_variants_list.log
