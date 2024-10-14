FROM ubuntu:24.04

SHELL ["/bin/bash", "-c"]

WORKDIR /root
RUN apt update -y && apt install -y tzdata && apt upgrade -y && \
    apt install -y sudo git cmake mecab libmecab-dev mecab-ipadic-utf8 build-essential \
                   wget htop vim unzip curl pciutils cpio zip tcpdump p7zip-full cifs-utils \
                   less tree gcc libssl-dev pkg-config && \
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y && \
    echo 'export PATH="/root/.cargo/bin:$PATH"' >> /root/.bashrc

# setup git completion/prompt
RUN wget -P /usr/local/src/ https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh && \
    wget -P /usr/local/src/ https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash

RUN echo 'if [ -f /usr/local/src/.git-completion.bash ]; then\n\
    source /usr/local/src/.git-completion.bash\n\
fi\n\
if [ -f /usr/local/src/.git-prompt.sh ]; then\n\
    source /usr/local/src/.git-prompt.sh\n\
fi\n\
GIT_PS1_SHOWDIRTYSTATE=true\n\
GIT_PS1_SHOWUNTRACKEDFILES=true\n\
GIT_PS1_SHOWSTASHSTATE=true\n\
GIT_PS1_SHOWUPSTREAM=auto\n\
PS1='\''[\[\033[32m\]\u@\h\[\033[00m\] \[\033[33m\]\w\[\033[1;36m\]$(__git_ps1 " (%s)")\[\033[00m\]]\n\$ '\''' >> /root/.bashrc

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

RUN mkdir -p /workplace
WORKDIR /workplace

