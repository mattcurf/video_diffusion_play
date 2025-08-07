CURRENT_DIR := $(shell pwd)

ARCH := $(shell uname -m)
ifeq ($(ARCH),arm64)
  ARCH := aarch64
endif

DOCKER_IMAGE_NAME = $(shell basename `pwd`)
DOCKER_ARGS = -it --rm -v `pwd`:/project -w /project -e HF_TOKEN=$(HF_TOKEN)

ifeq ($(shell [ -f "/proc/driver/nvidia/version" ] && echo yes),yes)
  DOCKER_ARGS += --gpus all --ipc=host --ulimit memlock=-1 --ulimit stack=67108864 -e HAS_GPU=1
  ifeq ($(shell [ -d "/usr/lib/wsl" ] && echo yes),yes)
    DOCKER_ARGS += --device /dev/dxg:/dev/dxg -v /usr/lib/wsl:/usr/lib/wsl
  endif
endif

DOCKER_ARGS += $(DOCKER_IMAGE_NAME)

default: run

models output_folder:
	mkdir $@
	chmod a+rwx $@

image: models output_folder
	@echo "Building Docker image $(DOCKER_IMAGE_NAME)..."
	@docker build . --progress plain -f Dockerfile.$(ARCH) -t $(DOCKER_IMAGE_NAME)

clean:
	@docker rmi $(DOCKER_IMAGE_NAME)

run: image
	@docker run $(DOCKER_ARGS)

shell: image 
	@docker run --entrypoint /bin/bash $(DOCKER_ARGS)
