FROM nvidia/cuda:12.6.3-cudnn-runtime-ubuntu24.04

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    ffmpeg \
    cython3 \
    git

WORKDIR /app

RUN python3 -m venv /app/venv
RUN /app/venv/bin/pip install --upgrade pip
ENV LD_LIBRARY_PATH="/usr/local/cuda-12.6/lib64:/app/venv/lib64/python3.12/site-packages/nvidia/cudnn/lib:/app/venv/lib64/python3.12/site-packages/nvidia/cublas/lib:$LD_LIBRARY_PATH"
ENV PATH="/app/venv/bin:$PATH"

COPY whisper-diarization/constraints.txt .
COPY whisper-diarization/requirements.txt .
RUN /app/venv/bin/pip install -c constraints.txt -r requirements.txt

COPY whisper-diarization/nemo_msdd_configs /app/nemo_msdd_configs/
COPY whisper-diarization/diarize_parallel.py /app/diarize_parallel.py
COPY whisper-diarization/diarize.py /app/diarize.py
COPY whisper-diarization/helpers.py /app/helpers.py
COPY whisper-diarization/nemo_process.py /app/nemo_process.py

ENTRYPOINT ["python", "diarize_parallel.py","--whisper-model","large-v3","--suppress_numerals","--language","en","-a"]
CMD []