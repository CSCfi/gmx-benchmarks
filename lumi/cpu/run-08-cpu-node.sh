#!/bin/bash
#SBATCH --partition=standard
#SBATCH --exclusive
#SBATCH --account=project_462000007
#SBATCH --time=00:15:00
#SBATCH --nodes=8
##SBATCH --gpus-per-node=1
#SBATCH --ntasks-per-node=32
#SBATCH --cpus-per-task=4

module use /appl/local/csc/modulefiles
module load gromacs/2026.1

env

export OMP_NUM_THREADS=4

srun      gmx_mpi mdrun \
             -s ../../stmv.tpr \
             -g stmv-c${SLURM_NTASKS}t${OMP_NUM_THREADS}_new.log \
             -e stmv-c${SLURM_NTASKS}t${OMP_NUM_THREADS}_new.edr \
             -nsteps -1 \
             -maxh 0.1 \
             -resethway \
             -noconfout \
             -notunepme \
             -nstlist 200

