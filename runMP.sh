if [[ $1 -gt 2 ]] 
then
   salloc --nodes 1 --qos interactive --time 02:00:00 --constraint gpu -G $1 --account=m4431
else
    salloc --nodes 1 --qos shared_interactive --time 02:00:00 --constraint gpu -G $1 --account=m4431
fi

source ../assignment-env/bin/activate
python train.py config/train_shakespeare_char.py --n_gpus=$1