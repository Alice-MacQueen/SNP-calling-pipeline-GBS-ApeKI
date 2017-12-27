#!/bin/bash
#SBATCH -J MPI_bwa           # job name
#SBATCH -o MPI_bwa.o%j       # output and error file name (%j expands to jobID)
#SBATCH -N 11               # total number of Nodes requested
#SBATCH -n 162              # total number of mpi tasks requested
#SBATCH -p normal     # queue (partition) -- normal, development, etc.
#SBATCH -t 01:30:00        # run time (hh:mm:ss) - 2.5 hours
#SBATCH --mail-user=alice.macqueen@utexas.edu
#SBATCH --mail-type=begin  # email me when the job starts
#SBATCH --mail-type=end    # email me when the job finishes
#SBATCH -A Genomics-of-salt-tol	# project I will charge this time to (Also have Genomics-of-salt-tol with an allocation)

# Load the launcher
module load launcher
module add samtools
module add bwa

# Load the command/parameter file
CMD="$SCRATCH/BWA-MEM-File.param"

# Execute the launcher job
EXECUTABLE=$TACC_LAUNCHER_DIR/init_launcher
$TACC_LAUNCHER_DIR/paramrun $EXECUTABLE $CMD

echo "Parametric job completed..."