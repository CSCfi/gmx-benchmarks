#!/bin/bash
#SBATCH --partition=small
#SBATCH --exclusive
#SBATCH --account=project_462000007
#SBATCH --time=00:15:00
#SBATCH --nodes=4
##SBATCH --gpus-per-node=1
#SBATCH --ntasks-per-node=128

module use /appl/local/csc/modulefiles
module load gromacs/2026.1

export OMP_NUM_THREADS=1

srun      gmx_mpi mdrun \
             -s ../../stmv.tpr \
             -g stmv-c$SLURM_NTASKS.log \
             -e stmv-c$SLURM_NTASKS.edr \
             -nsteps -1 \
             -maxh 0.1 \
             -resethway \
             -noconfout \
             -notunepme \
             -nstlist 200
