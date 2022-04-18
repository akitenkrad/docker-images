FROM ubuntu:20.04

WORKDIR /root
RUN apt update -y && apt install -y tzdata && apt upgrade -y
RUN apt install -y sudo git cmake mecab libmecab-dev mecab-ipadic-utf8 build-essential \
                   wget htop vim unzip curl pciutils cpio zip tcpdump

# install python
RUN apt install -y software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt install -y python3.9 python3-dev python3-pip && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3.9 3
RUN python -m pip install pipenv

# setup vim
RUN mkdir -p /root/.vim/colors
COPY despacio.vim /root/.vim/colors/
COPY .vimrc /root/

# create env shell
RUN touch /root/.init.sh && \
    chmod +x /root/.init.sh && \
    echo "export LANG=C.UTF-8" >> /root/.bashrc && \
    echo "export LANGUAGE=en_US:" >> /root/.bashrc && \
    echo ". /root/.init.sh" >> /root/.bashrc

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

