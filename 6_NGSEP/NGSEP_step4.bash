#!/bin/bash
#SBATCH -J Step4           # job name
#SBATCH -o Step4.o%j       # output and error file name (%j expands to jobID)
#SBATCH -N 1               # total number of Nodes requested
#SBATCH -n 1              # total number of mpi tasks requested 607 to run
#SBATCH -p normal     # queue (partition) -- normal, development, etc.
#SBATCH -t 48:00:00        # run time (hh:mm:ss) - 1.5 hours
#SBATCH --mail-user=alice.macqueen@utexas.edu
#SBATCH --mail-type=begin  # email me when the job starts
#SBATCH --mail-type=end    # email me when the job finishes
#SBATCH -A Genomics-of-salt-tol	# project I will charge this time to (Also have Genomics-of-salt-tol with an allocation)

$WORK/bin/jdk1.8.0_144/jre/bin/java -Xms1G -Xmx8G -jar $WORK/bin/NGSEPcore_3.1.0/NGSEPcore_3.0.2.jar MergeVCF $HOME/Pvulgaris_G19833/assembly/Pvulgaris_G19833_mainGenome_seqnames.txt $SCRATCH/6b_NGSEP_ind_vcfs/*HiQ_NGSEP.vcf 1> $SCRATCH/7_NGSEP_pop_vcf/All_610_pop.vcf 2> $SCRATCH/7_NGSEP_pop_vcf/All_610_pop.log

mv *combined* $SCRATCH/6b_NGSEP_ind_vcfs/Combined/
$WORK/bin/jdk1.8.0_144/jre/bin/java -Xms1G -Xmx8G -jar $WORK/bin/NGSEPcore_3.1.0/NGSEPcore_3.0.2.jar MergeVCF $HOME/Pvulgaris_G19833/assembly/Pvulgaris_G19833_mainGenome_seqnames.txt $SCRATCH/6b_NGSEP_ind_vcfs/*HiQ_NGSEP.vcf 1> $SCRATCH/7_NGSEP_pop_vcf/Uncombined_526_pop.vcf 2> $SCRATCH/7_NGSEP_pop_vcf/Uncombined_512_pop.log

mv *ind[2-4]* $SCRATCH/6b_NGSEP_ind_vcfs/Individuals/
$WORK/bin/jdk1.8.0_144/jre/bin/java -Xms1G -Xmx8G -jar $WORK/bin/NGSEPcore_3.1.0/NGSEPcore_3.0.2.jar MergeVCF $HOME/Pvulgaris_G19833/assembly/Pvulgaris_G19833_mainGenome_seqnames.txt $SCRATCH/6b_NGSEP_ind_vcfs/*HiQ_NGSEP.vcf 1> $SCRATCH/7_NGSEP_pop_vcf/Best_Ind_CDBN_Parents_pop.vcf 2> $SCRATCH/7_NGSEP_pop_vcf/Best_Ind_CDBN_Parents_pop.log

mv *Parent* $SCRATCH/6b_NGSEP_ind_vcfs/Parents/
$WORK/bin/jdk1.8.0_144/jre/bin/java -Xms1G -Xmx8G -jar $WORK/bin/NGSEPcore_3.1.0/NGSEPcore_3.0.2.jar MergeVCF $HOME/Pvulgaris_G19833/assembly/Pvulgaris_G19833_mainGenome_seqnames.txt $SCRATCH/6b_NGSEP_ind_vcfs/*HiQ_NGSEP.vcf 1> $SCRATCH/7_NGSEP_pop_vcf/CDBN_Best_Ind_pop.vcf 2> $SCRATCH/7_NGSEP_pop_vcf/CDBN_Best_Ind_pop.log
