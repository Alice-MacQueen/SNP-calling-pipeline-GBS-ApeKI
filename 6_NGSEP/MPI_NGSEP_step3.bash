#!/bin/bash
#SBATCH -J Step3           # job name
#SBATCH -o Step3.o%j       # output and error file name (%j expands to jobID)
#SBATCH -N 30               # total number of Nodes requested
#SBATCH -n 120              # total number of mpi tasks requested 607 to run
#SBATCH -p normal     # queue (partition) -- normal, development, etc.
#SBATCH -t 24:00:00        # run time (hh:mm:ss) - 1.5 hours
#SBATCH --mail-user=alice.macqueen@utexas.edu
#SBATCH --mail-type=begin  # email me when the job starts
#SBATCH --mail-type=end    # email me when the job finishes
#SBATCH -A Genomics-of-salt-tol	# project I will charge this time to (Also have Genomics-of-salt-tol with an allocation)

# Load the launcher
module load launcher

# Load the command/parameter file
CMD="$SCRATCH/7_NGSEP_pop_vcf/NGSEP_step3.param"

# Execute the launcher job
EXECUTABLE=$TACC_LAUNCHER_DIR/init_launcher
$TACC_LAUNCHER_DIR/paramrun $EXECUTABLE $CMD

echo "Parametric job completed..."