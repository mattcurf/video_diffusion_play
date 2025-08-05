# video_diffusion_play
Generate videos from text using the latest Wan2.2 model from https://wan.video and Alibaba's Tongyi Lab

## Hardware Configuration 
* Intel/AMD system with at least 24 cores
* 256 GB DDR5
* NVIDIA 5090 w/ 32GB VRAM
* 150GB free storage space for models

## Prerequisites 

System setup with:
* kernel drivers for NVIDIA GPU
* docker with NVIDIA-Runtime support
* 'make' installed with your package manager (e.g. apt install make)
 
## Steps for setup and execution

1. Build docker container
```bash
$ make image
```

2. Run sample text to video script
```bash
$ make run
```
On NVIDIA 5090 card, it takes about 45 minutes to generate about 81 frames of 1280x720p video

## References
* https://github.com/Wan-Video/Wan2.2
* https://huggingface.co/DFloat11/Wan2.2-T2V-A14B-DF11

