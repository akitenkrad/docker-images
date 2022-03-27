FROM nvidia/cuda:11.4.1-runtime-ubuntu20.04

WORKDIR /root
RUN apt update -y && apt install -y tzdata && apt upgrade -y
RUN apt install -y sudo git cmake mecab libmecab-dev mecab-ipadic-utf8 build-essential \
                   wget htop vim unzip curl pciutils cpio zip tcpdump

# setup vim
RUN mkdir -p /root/.vim/colors
COPY despacio.vim /root/.vim/colors/
COPY .vimrc /root/

# install miniconda
RUN rm -rf /var/lib/apt/lists/* && \
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    mkdir -p /root/.conda && \
    bash Miniconda3-latest-Linux-x86_64.sh -b -p /root/miniconda3

ENV PATH "/root/miniconda3/bin:$PATH"

RUN conda init bash && \
    rm -f Miniconda3-latest-Linux-x86_64.sh

RUN touch /root/.init.sh && \
    chmod +x /root/.init.sh && \
    echo "export LANG=C.UTF-8" >> /root/.bashrc && \
    echo "export LANGUAGE=en_US:" >> /root/.bashrc && \
    echo ". /root/.init.sh" >> /root/.bashrc

# create python env
RUN conda create -y -n python39 python=3.9 && \
    echo "conda activate python39" >> /root/.init.sh
ENV PATH "/root/miniconda3/envs/python39/bin:$PATH"
RUN /bin/bash -c "conda activate python39"

# install latest npm
RUN apt update -y && \
    apt install -y nodejs npm && \
    npm install -g n && \
    n stable && \
    apt purge -y nodejs npm

# install mecab
RUN apt update -y && \
    cd /usr/src/ && \
    git clone https://github.com/neologd/mecab-ipadic-neologd.git && \
    cd /usr/src/mecab-ipadic-neologd && \
    sed -E -i -e 's/^\s*wanna_install\s*//g' bin/install-mecab-ipadic-neologd && \
    bash bin/install-mecab-ipadic-neologd

WORKDIR /root/

# install aws cli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    bash aws/install && \
    rm -rf awscliv2.zip aws

