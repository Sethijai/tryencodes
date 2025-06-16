FROM colserra/fedora37_wf:latest
WORKDIR /bot
RUN python3 -m pip install --upgrade pip
RUN dnf update -y --refresh
RUN dnf install -y git \
    python3 \
    python3-pip \
    wget \
    zstd \
    p7zip \
    ffmpeg \
    curl
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt
COPY . .
CMD ["bash", "start.sh"]
