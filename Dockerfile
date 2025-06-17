FROM colserra/fedora37_wf:latest
WORKDIR /bot
RUN python3 -m pip install --upgrade pip
RUN dnf update -y --refresh
# Enable RPM Fusion free repository and install packages
RUN dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-37.noarch.rpm && \
    dnf install -y git python3 python3-pip zstd p7zip ffmpeg
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt
COPY . .
CMD ["bash", "start.sh"]
