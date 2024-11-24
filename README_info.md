# This file is for information about coding we want to share (I think it is easier than TRELLO)

# Access GPU (for real)
In order to do so you have to first adapt the "hph_gpu_access.sh" file:
	- JobName L29
	- Walltime Limit L44 (maximum duration on GPU, smaller time will be scheduled earlier)
	- E-Mail L53 (for receiving information when job is starting ending)
	- environment L129 (if already existing/activated is doesn't matter what variables are defined)
	- Command L245 (MANDATORY!!!)
After that just run the command "bsub < hpc_gpu_access.sh" to submit Job to the GPU Queue
With the command "bstat" you can get an overview about the submitted Job
With the command "bkill JOBNUMBER" you can stop the job with the corresponding JOBNUMBER (JOBNUMBER can be found with "bstat")

# Installing additional packages
pip install pyarrow (for concatenating the data)

# Run main function from EHR_Mamba
python pretrain.py --model_type = ehr_mamba 

python pretrain.py \
  --model_type ehr_mamba \
  --exp_name test_Lukas \
  --config_dir odyssey/models/configs \
  --data_dir <DATA_DIR> \
  --vocab_dir NEEDED \
  --tokenizer_type not_needed_now \
  --checkpoint_dir Lukas_checkpoints