from model import Block, GPTConfig
import torch

cfg = GPTConfig(block_size=16, vocab_size=100, n_layer=2, n_head=2, n_embd=32, n_gpus=1, dropout=0.0, bias=True)
block = Block(cfg).to('cpu')
# make a dummy input: batch=2, seq_len=8, embd=cfg.n_embd
x = torch.randn(2, 8, cfg.n_embd)
out = block(x)
print('output shape:', out.shape)
