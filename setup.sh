#!/bin/bash -i
set -eu

apt update -y && apt upgrade -y
apt install -y sudo nodejs npm xvfb python-opengl ffmpeg \
               git cmake mecab libmecab-dev mecab-ipadic-utf8 \
               build-essential wget htop libgtk-3-0 lsb-release kmod \
               pciutils libboost-all-dev intel-gpu-tools cpio vim

# install miniconda
rm -rf /var/lib/apt/lists/*
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
mkdir -p /root/.conda
bash Miniconda3-latest-Linux-x86_64.sh
rm -f Miniconda3-latest-Linux-x86_64.sh

touch /root/.init.sh
chmod +x /root/.init.sh
echo ". /root/.init.sh" >> /root/.bashrc

debian_chroot=;force_color_prompt=;color_prompt=
source ~/.bashrc

# create python env
conda --version
conda create -y -n python38 python=3.8
echo "conda activate python38" >> /root/.init.sh

debian_chroot=;force_color_prompt=;color_prompt=
source ~/.bashrc

python --version

pip install --upgrade pip
pip install -U numpy scipy matplotlib ipython scikit-learn pandas pillow \
               tqdm beautifulsoup4 janome \
               mecab-python3 gensim nltk seaborn opencv-python \
               torch torchvision torchtext \
               motmetrics pyyaml \
               jupyterlab_widgets ipywidgets

# install latest npm
apt install nodejs npm
npm install -g n
n stable
apt purge -y nodejs npm

debian_chroot=;force_color_prompt=;color_prompt=
source ~/.bashrc

# install mecab
cd /usr/src/
git clone https://github.com/neologd/mecab-ipadic-neologd.git
cd /usr/src/mecab-ipadic-neologd
sed -E -i -e 's/^\s*wanna_install\s*//g' bin/install-mecab-ipadic-neologd
./bin/install-mecab-ipadic-neologd

cd /root/

# install jupyterlab
pip install 'jupyterlab>=3.0.0,<4.0.0a0'

jupyter serverextension enable --py jupyterlab
pip install jupyterlab_vim
pip install jupyterlab-lsp
pip install python-language-server[all]
