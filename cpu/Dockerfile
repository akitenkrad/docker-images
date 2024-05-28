FROM ubuntu:24.04

SHELL ["/bin/bash", "-c"]

WORKDIR /root
RUN apt update -y && apt install -y tzdata && apt upgrade -y && \
    apt install -y sudo git cmake mecab libmecab-dev mecab-ipadic-utf8 build-essential \
                   wget htop vim unzip curl pciutils cpio zip tcpdump p7zip-full cifs-utils

# install python
RUN rm -rf /var/lib/apt/lists/* && \
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    mkdir -p /root/.conda && \
    bash Miniconda3-latest-Linux-x86_64.sh -b -p /root/miniconda3
ENV PATH "/root/miniconda3/bin:$PATH"
RUN conda init bash && \
    rm -f Miniconda3-latest-Linux-x86_64.sh

# create env shell
RUN echo "export LANG=C.UTF-8" >> /root/.bashrc && \
    echo "export LANGUAGE=en_US" >> /root/.bashrc

# create python env
RUN conda create -y -n python312 python=3.12 && \
    echo "conda activate python312" >> /root/.bashrc
ENV PATH "/root/miniconda3/envs/python311/bin:$PATH"
RUN exec /bin/bash -l && \
    conda activate python312 && \
    python -m pip install git+https://github.com/akitenkrad/tools

# setup vim
RUN mkdir -p /root/.vim/colors
COPY despacio.vim /root/.vim/colors/
COPY .vimrc /root/

# copy .vscode/settings.json
RUN mkdir -p /root/.vscode/
COPY settings.json /root/.vscode/

# install latest npm
RUN apt update -y && \
    apt install -y nodejs npm && \
    npm install -g n && \
    n stable && \
    apt purge -y nodejs npm

WORKDIR /root/

