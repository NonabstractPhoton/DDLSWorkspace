source "/pscratch/sd/a/atharvt/assignment-env/bin/activate"
torchrun --standalone --nproc_per_node=4 /pscratch/sd/a/atharvt/nanoGPT/train.py /pscratch/sd/a/atharvt/nanoGPT/config/train_shakespeare_char.py
