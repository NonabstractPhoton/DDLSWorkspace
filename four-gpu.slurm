#!/bin/bash
#SBATCH -A m4431_g
#SBATCH -C gpu
#SBATCH -q regular
#SBATCH -t 00:15:00
#SBATCH -N 1
#SBATCH --ntasks-per-node=1
#SBATCH -c 32
#SBATCH --gpus-per-task=4
#SBATCH --mail-user=atharv.thakur@rutgers.edu
#SBATCH --mail-type=begin

export SLURM_CPU_BIND="cores"
srun train_shakespeare_four_gpu.sh
