source "/pscratch/sd/a/atharvt/assignment-env/bin/activate"
torchrun --nnodes=2 --nproc_per_node=4 --master_addr=$MASTER_ADDR --master_port=$MASTER_PORT /pscratch/sd/a/atharvt/nanoGPT/train.py /pscratch/sd/a/atharvt/nanoGPT/config/train_shakespeare_char.py
