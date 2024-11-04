# Structured_SSM_for_EHR_Classification
Project 24 for 02456 2024

# Background
This repository allows you to train and test a variety of electronic health record (EHR) classification models on mortality prediction for the Physionet 2012 Challenge (`P12`) dataset. More information on the dataset can be found here (https://physionet.org/content/challenge-2012/1.0.0/). Note that the data in the repository has already been preprocessed (outliers removed, normalized) in accordance with https://physionet.org/content/challenge-2012/1.0.0/ and saved as 5 randomized splits of train/validation/test data. Adam is used for optimization.

# Create Environment
The dependencies are listed for python 3.9.

To create a venv, run: 

`pip install -r requirements.txt` 



# Run models 
4 baseline models have been implemented in `Pytorch` and can be trained/tested on `P12`. Each has a unique set of hyperparameters that can be modified, but I've gotten the best performance by running the following commands (_Note: you should change the output paths_):

`transformer` (https://arxiv.org/abs/1706.03762):

`python cli.py --output_path=your/path/here --epochs=100 --batch_size=16 --model_type=vanilla --dropout=0.2 --attn_dropout=0.1 --layers=3 --heads=1 --pooling=max --lr=0.0001 --value_embed_size=8` 


`seft` (https://github.com/BorgwardtLab/Set_Functions_for_Time_Series):

`python cli.py --output_path=your/path/here --model_type=seft --epochs=100 --batch_size=128 --dropout=0.4 --attn_dropout=0.3 --heads=2 --lr=0.01 --seft_dot_prod_dim=512 --seft_n_phi_layers=1 --seft_n_psi_layers=5 --seft_n_rho_layers=2 --seft_phi_dropout=0.3 --seft_phi_width=512 --seft_psi_width=32 --seft_psi_latent_width=128 --seft_latent_width=64 --seft_rho_dropout=0.0 --seft_rho_width=256 --seft_max_timescales=1000 --seft_n_positional_dims=16`

`grud` (https://github.com/PeterChe1990/GRU-D/blob/master/README.md):

`python cli.py --output_path=your/path/here --model_type=grud --epochs=100 --batch_size=32 --lr=0.0001 --recurrent_dropout=0.2 --recurrent_n_units=128`

`ipnets` (https://github.com/mlds-lab/interp-net):

`python cli.py --output_path=your/path/here --model_type=ipnets --epochs=100 --batch_size=32 --lr=0.001 --ipnets_imputation_stepsize=1 --ipnets_reconst_fraction=0.75 --recurrent_dropout=0.3 --recurrent_n_units=32` 


# DIY
You are welcome to fork the repository and make your own modifications :) 