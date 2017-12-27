#!/bin/bash
#SBATCH -J unzip_12	# job name
#SBATCH -o unzip%j		# output and error file name (%j expands to jobID)
#SBATCH -n 1			# total number of mpi tasks requested
#SBATCH -p normal		# queue (partition) -- normal, development, largemem(x4), etc.
#SBATCH -t 3:00:00		# run time (hh:mm:ss) - 3 hours
#SBATCH -A Genomics-of-salt-tol	# project I will charge this time to (Also have Genomics-of-salt-tol with an allocation)
#SBATCH --mail-user=alice.macqueen@utexas.edu
#SBATCH --mail-type=all		# email me when the job starts, ends, or has an error

bzip2 -dk /scratch/04022/macqueen/plate02/IBQX_GBS_NDSUDR1_McClean_GBS2_I311_L1_R1.fastq.bz2
bzip2 -dk /scratch/04022/macqueen/plate03/IBQY_GBS_NDSUGBS2_McClean_GBS3_I311_L2_R1.fastq.bz2
bzip2 -dk /scratch/04022/macqueen/plate04/IBUR_GBS_NDSUGBS4_McClean_GBS4_I350_L1_R1.fastq.bz2
bzip2 -dk /scratch/04022/macqueen/plate04/IBUR_GBS_NDSUGBS4_McClean_GBS4_I346_L1_R1.fastq.bz2
bzip2 -dk /scratch/04022/macqueen/plate05/IBUS_GBS_NDSUGBS5_McClean_GBS5_I346_L2_R1.fastq.bz2
bzip2 -dk /scratch/04022/macqueen/plate05/IBUS_GBS_NDSUGBS5_McClean_GBS5_I350_L2_R1.fastq.bz2
bzip2 -dk /scratch/04022/macqueen/plate06/ICBL_GBS_GBS6_NONE_NA_I370_L1_R1.fastq.bz2
bzip2 -dk /scratch/04022/macqueen/plate07/ICBM_GBS_GBS7_NONE_NA_I370_L2_R1.fastq.bz2
bzip2 -dk /scratch/04022/macqueen/plate08/ICBN_GBS_GBS8_NONE_NA_I371_L1_R1.fastq.bz2
bzip2 -dk /scratch/04022/macqueen/plate09/ICBP_GBS_GBS9_NONE_NA_I371_L2_R1.fastq.bz2
bzip2 -dk /scratch/04022/macqueen/plate10/IIXC_GBS_CDGN1_NONE_NA_I709_L1_R1.fastq.bz2
bzip2 -dk /scratch/04022/macqueen/plate11/IIXD_GBS_CDGN2_NONE_NA_I709_L2_R1.fastq.bz2
