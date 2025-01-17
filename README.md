# Whisper Nemo Diarization

Running this Dockerfile requires the [NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html) to be installed on the host.

The `nvidia/cuda` base image version in the Dockerfile must match the current version of Cuda drivers on the host.

Clone the `whisper-diarization` repo the docker image will be base on:

```
git clone https://github.com/MahmoudAshraf97/whisper-diarization.git
```

Build and run the docker container:

```
docker build -t whisper-nemo .

docker run -it --privileged --rm --gpus all -v "$(pwd)/files:/app/files" -v "$(pwd)/huggingface:/root/.cache/huggingface" whisper-nemo files/<file name>
```
