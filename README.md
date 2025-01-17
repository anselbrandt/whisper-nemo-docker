# Whisper Nemo Diarization

```
git clone https://github.com/MahmoudAshraf97/whisper-diarization.git
```

```
docker build -t whisper-nemo .

docker run -it --privileged --rm --gpus all -v "$(pwd)/files:/app/files" -v "$(pwd)/huggingface:/root/.cache/huggingface" whisper-nemo files/<file name>
```
