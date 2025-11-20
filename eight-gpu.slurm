#!/bin/bash
#SBATCH -A m4431
#SBATCH -C gpu
#SBATCH -q regular
#SBATCH -t 00:15:00
#SBATCH -N 2
#SBATCH --ntasks-per-node=1
#SBATCH --gpus-per-node=4
#SBATCH --mail-type=begin

export MASTER_ADDR=$(scontrol show hostname $SLURM_JOB_NODELIST | head -n 1)
export MASTER_PORT=29500

ml cudatoolkit/12.9
source "../assignment-env/bin/activate"

srun -N 2 --ntasks-per-node=1 --gpus-per-node=4 torchrun \
	--nnodes=2 \
	--nproc_per_node=4 \
	--rdzv_id=$SLURM_JOB_ID \
	--rdzv_backend=c10d \
	--rdzv_endpoint=$MASTER_ADDR:$MASTER_PORT \
	/pscratch/sd/a/atharvt/nanoGPT/train.py /pscratch/sd/a/atharvt/nanoGPT/config/train_shakespeare_char.py

