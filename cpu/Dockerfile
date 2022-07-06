FROM ubuntu:22.04

WORKDIR /root
RUN apt update -y && apt install -y tzdata && apt upgrade -y && \
    apt install -y sudo git cmake mecab libmecab-dev mecab-ipadic-utf8 build-essential \
                   wget htop vim unzip curl pciutils cpio zip tcpdump

# create env shell
RUN touch /root/.init.sh && \
    chmod +x /root/.init.sh && \
    echo "export LANG=C.UTF-8" >> /root/.bashrc && \
    echo "export LANGUAGE=en_US" >> /root/.bashrc && \
    echo ". /root/.init.sh" >> /root/.bashrc

# install python
RUN apt update -y && sudo apt upgrade -y && \
    apt install software-properties-common -y && \
    add-apt-repository ppa:deadsnakes/ppa -y && \
    apt update -y && \
    apt -y install python3.10 python3.10-dev python3.10-venv python3-pip python3.10-distutils && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3.10 1 && \
    python -m pip install pipenv && \
    echo "export SHELL=/bin/bash" >> /root/.bashrc && \
    echo "export SHELL=/bin/bash" >> /root/.zshrc && \
    echo "source /root/.zshrc" >> /root/.init.sh && \
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
# install aws cli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    bash aws/install && \
    rm -rf awscliv2.zip aws

