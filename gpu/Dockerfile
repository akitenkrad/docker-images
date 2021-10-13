FROM nvidia/cuda:11.4.1-runtime-ubuntu20.04

WORKDIR /root
RUN apt update -y && apt install -y tzdata && apt upgrade -y
RUN apt install -y sudo git cmake mecab libmecab-dev mecab-ipadic-utf8 build-essential \
                   wget htop vim unzip curl pciutils cpio zip tcpdump tshark

# install wireshark tshark
RUN DEBIAN_FRONTEND=noninteractive apt install -y tshark
RUN DEBIAN_FRONTEND=noninteractive apt install -y wireshark

# install texlive
RUN wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz && \
    tar xvf install-tl-unx.tar.gz && \
    cd install-tl-2* && \
    yes I | ./install-tl -no-gui

# setup vim
RUN mkdir -p /root/.vim/colors
COPY python-docker/cpu/despacio.vim /root/.vim/colors/
COPY python-docker/cpu/.vimrc /root/

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
RUN conda create -y -n python38 python=3.8 && \
    echo "conda activate python38" >> /root/.init.sh
ENV PATH "/root/miniconda3/envs/python38/bin:$PATH"
RUN /bin/bash -c "source activate python38"

RUN pip install --upgrade pip
RUN pip install -U numpy scipy matplotlib ipython scikit-learn pandas pillow \
                   tqdm beautifulsoup4 janome attrdict \
                   mecab-python3 gensim nltk seaborn opencv-python \
                   torch torchvision torchtext \
                   motmetrics pyyaml \
                   jupyterlab_widgets ipywidgets

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

# install jupyterlab
RUN pip install 'jupyterlab>=3.0.0,<4.0.0a0' && \
    jupyter serverextension enable --py jupyterlab && \
    pip install jupyterlab_vim && \
    pip install jupyterlab-lsp && \
    pip install python-language-server[all]

# install aws cli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    bash aws/install && \
    rm -rf awscliv2.zip aws

