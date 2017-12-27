#!/bin/bash
#SBATCH -J cutadapt	# job name
#SBATCH -o cutadapt_%j		# output and error file name (%j expands to jobID)
#SBATCH -n 12			# total number of mpi tasks requested
#SBATCH -p normal		# queue (partition) -- normal, development, largemem(x4), etc.
#SBATCH -t 15:00:00		# run time (hh:mm:ss) - 15 hours
#SBATCH -A Genomics-of-salt-tol	# project I will charge this time to (Also have Genomics-of-salt-tol with an allocation)
#SBATCH --mail-user=alice.macqueen@utexas.edu
#SBATCH --mail-type=all		# email me when the job starts, ends, or has an error


$HOME/.local/bin/cutadapt -g file:$SCRATCH/cutadapt_barcode_fasta/plate2_barcodes.fasta -e 0.2 --untrimmed-o $SCRATCH/unmatched_cutadapt/untrimmed02.fastq.gz -o $SCRATCH/cutadapt_trim5/bctrim5_{name}.fastq.gz $SCRATCH/plate02/IBQX_GBS_NDSUDR1_McClean_GBS2_I311_L1_R1.fastq 

$HOME/.local/bin/cutadapt -g file:$SCRATCH/cutadapt_barcode_fasta/plate3_barcodes.fasta -e 0.2 --untrimmed-o $SCRATCH/unmatched_cutadapt/untrimmed03.fastq.gz -o $SCRATCH/cutadapt_trim5/bctrim5_{name}.fastq.gz $SCRATCH/plate03/IBQY_GBS_NDSUGBS2_McClean_GBS3_I311_L2_R1.fastq 

$HOME/.local/bin/cutadapt -g file:$SCRATCH/cutadapt_barcode_fasta/plate4_barcodes.fasta -e 0.2 --untrimmed-o $SCRATCH/unmatched_cutadapt/untrimmed04.fastq.gz -o $SCRATCH/cutadapt_trim5/bctrim5_{name}.fastq.gz $SCRATCH/plate04/IBUR_GBS_NDSUGBS4_McClean_GBS4_I350_L1_R1.fastq 

$HOME/.local/bin/cutadapt -g file:$SCRATCH/cutadapt_barcode_fasta/plate4_run2_barcodes.fasta -e 0.2 --untrimmed-o $SCRATCH/unmatched_cutadapt/untrimmed04_run2.fastq.gz -o $SCRATCH/cutadapt_trim5/bctrim5_{name}.fastq.gz $SCRATCH/plate04_2/IBUR_GBS_NDSUGBS4_McClean_GBS4_I346_L1_R1.fastq 

$HOME/.local/bin/cutadapt -g file:$SCRATCH/cutadapt_barcode_fasta/plate5_barcodes.fasta -e 0.2 --untrimmed-o $SCRATCH/unmatched_cutadapt/untrimmed05.fastq.gz -o $SCRATCH/cutadapt_trim5/bctrim5_{name}.fastq.gz $SCRATCH/plate05/IBUS_GBS_NDSUGBS5_McClean_GBS5_I346_L2_R1.fastq 

$HOME/.local/bin/cutadapt -g file:$SCRATCH/cutadapt_barcode_fasta/plate5_run2_barcodes.fasta -e 0.2 --untrimmed-o $SCRATCH/unmatched_cutadapt/untrimmed05_run2.fastq.gz -o $SCRATCH/cutadapt_trim5/bctrim5_{name}.fastq.gz $SCRATCH/plate05_2/IBUS_GBS_NDSUGBS5_McClean_GBS5_I350_L2_R1.fastq 

$HOME/.local/bin/cutadapt -g file:$SCRATCH/cutadapt_barcode_fasta/plate6_barcodes.fasta -e 0.2 --untrimmed-o $SCRATCH/unmatched_cutadapt/untrimmed06.fastq.gz -o $SCRATCH/cutadapt_trim5/bctrim5_{name}.fastq.gz $SCRATCH/plate06/ICBL_GBS_GBS6_NONE_NA_I370_L1_R1.fastq 

$HOME/.local/bin/cutadapt -g file:$SCRATCH/cutadapt_barcode_fasta/plate7_barcodes.fasta -e 0.2 --untrimmed-o $SCRATCH/unmatched_cutadapt/untrimmed07.fastq.gz -o $SCRATCH/cutadapt_trim5/bctrim5_{name}.fastq.gz $SCRATCH/plate07/ICBM_GBS_GBS7_NONE_NA_I370_L2_R1.fastq 

$HOME/.local/bin/cutadapt -g file:$SCRATCH/cutadapt_barcode_fasta/plate8_barcodes.fasta -e 0.2 --untrimmed-o $SCRATCH/unmatched_cutadapt/untrimmed08.fastq.gz -o $SCRATCH/cutadapt_trim5/bctrim5_{name}.fastq.gz $SCRATCH/plate08/ICBN_GBS_GBS8_NONE_NA_I371_L1_R1.fastq 

$HOME/.local/bin/cutadapt -g file:$SCRATCH/cutadapt_barcode_fasta/plate9_barcodes.fasta -e 0.2 --untrimmed-o $SCRATCH/unmatched_cutadapt/untrimmed09.fastq.gz -o $SCRATCH/cutadapt_trim5/bctrim5_{name}.fastq.gz $SCRATCH/plate09/ICBP_GBS_GBS9_NONE_NA_I371_L2_R1.fastq 

$HOME/.local/bin/cutadapt -g file:$SCRATCH/cutadapt_barcode_fasta/plate10_barcodes.fasta -e 0.2 --untrimmed-o $SCRATCH/unmatched_cutadapt/untrimmed10.fastq.gz -o $SCRATCH/cutadapt_trim5/bctrim5_{name}.fastq.gz $SCRATCH/plate10/IIXC_GBS_CDGN1_NONE_NA_I709_L1_R1.fastq 

$HOME/.local/bin/cutadapt -g file:$SCRATCH/cutadapt_barcode_fasta/plate11_barcodes.fasta -e 0.2 --untrimmed-o $SCRATCH/unmatched_cutadapt/untrimmed11.fastq.gz -o $SCRATCH/cutadapt_trim5/bctrim5_{name}.fastq.gz $SCRATCH/plate11/IIXD_GBS_CDGN2_NONE_NA_I709_L2_R1.fastq 

for i in $SCRATCH/cutadapt_trim5/bctrim5_*.fastq.gz
do
  OUTPUT=$(echo ${i} | sed "s/trim5\/bctrim5/trim3\/trimmed/" | sed "s/\.fastq\.gz//")
  $HOME/.local/bin/cutadapt -a GAGATCGGAAGAGCGGTTCAGCAGGAATGCCGAG -o ${OUTPUT}.fastq.gz ${i}
done

