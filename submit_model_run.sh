#!/bin/sh
### General options
### –- specify queue --
#BSUB -q gpuv100
### -- set the job Name --
#BSUB -J ipnets_job
### -- ask for number of cores (default: 1) --
#BSUB -n 4
### -- Select the resources: 1 gpu in exclusive process mode --
#BSUB -gpu "num=1:mode=exclusive_process"
### -- set walltime limit: hh:mm --  maximum 24 hours for GPU-queues right now
#BSUB -W 1:00
# request 5GB of system-memory
#BSUB -R "rusage[mem=5GB]"
### -- set the email address --
# Notification email address
#BSUB -u s242798@dtu.dk
### -- send notification at start --
#BSUB -B
### -- send notification at completion--
#BSUB -N
### -- Specify the output and error file. %J is the job-id --
### -- -o and -e mean append, -oo and -eo mean overwrite --
#BSUB -o gpu_%J.out
#BSUB -e gpu_%J.err
# -- end of LSF options --

# Load the CUDA module
module load cuda/11.8
module load cudnn/v8.8.0-prod-cuda-11.X

# Set environment variables
export PATH=/zhome/b0/3/214044/miniconda3/envs/mamba_p12/bin:$PATH
export PYTHONPATH=/zhome/b0/3/214044/miniconda3/envs/mamba_p12/bin/python3.9

# Run the Python script with specified parameters
python /dtu/blackhole/1c/214044/Project_NEW/DeepLearning-P24/cli.py \
  --output_path=/dtu/blackhole/1c/214044/Project_NEW/DeepLearning-P24/mamba_results \
  --model_type=mamba