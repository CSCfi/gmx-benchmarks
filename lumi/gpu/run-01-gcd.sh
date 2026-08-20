#!/bin/bash
#SBATCH --partition=dev-g
#SBATCH --exclusive
#SBATCH --account=project_462000007
#SBATCH --time=00:10:00
#SBATCH --nodes=1
#SBATCH --gpus-per-node=1
#SBATCH --ntasks-per-node=1

module use /appl/local/csc/modulefiles
module load gromacs/2026.1-gpu

export OMP_NUM_THREADS=7
export MPICH_GPU_SUPPORT_ENABLED=1
export GMX_ENABLE_DIRECT_GPU_COMM=true
export GMX_FORCE_GPU_AWARE_MPI=true

cat << EOF > select_gpu
#!/bin/bash

export ROCR_VISIBLE_DEVICES=\$((SLURM_LOCALID%SLURM_GPUS_PER_NODE))
exec \$*
EOF

chmod +x ./select_gpu

CPU_BIND="mask_cpu:fe000000000000,fe00000000000000"
CPU_BIND="${CPU_BIND},fe0000,fe000000"
CPU_BIND="${CPU_BIND},fe,fe00"
CPU_BIND="${CPU_BIND},fe00000000,fe0000000000"

srun --cpu-bind=${CPU_BIND} ./select_gpu \
     gmx_mpi mdrun \
             -s ../../stmv.tpr \
             -g stmv-g$SLURM_GPUS_PER_NODE.log \
             -e stmv-g$SLURM_GPUS_PER_NODE.edr \
             -nsteps -1 \
             -maxh 0.1 \
             -resethway \
             -noconfout \
             -notunepme \
             -nb gpu \
             -bonded gpu \
             -pme gpu \
             -update gpu \
             -nstlist 200
