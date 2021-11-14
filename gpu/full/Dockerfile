FROM akitenkrad/python:gpu.base

WORKDIR /root
RUN apt update -y && apt install -y tzdata && apt upgrade -y

# install wireshark tshark
RUN DEBIAN_FRONTEND=noninteractive apt install -y tshark
RUN DEBIAN_FRONTEND=noninteractive apt install -y wireshark

# install texlive
RUN apt install texlive-full && \
    apt install xzdec && tlmgr init-usertreea && \
    apt install texlive-luatex && \
                texlive-latex-recommended && \
                texlive-latex-extra && \
                fonts-lmodern && \
                texlive-xetex && \
                latex-cjk-common && \
                texlive-fonts-extra

# install python packages
RUN pip install --upgrade pip
RUN pip install -U numpy scipy matplotlib ipython scikit-learn pandas pillow \
                   tqdm beautifulsoup4 janome attrdict \
                   mecab-python3 gensim nltk seaborn opencv-python \
                   torch torchvision torchtext \
                   motmetrics pyyaml \
                   jupyterlab_widgets ipywidgets

WORKDIR /root/

# install jupyterlab
RUN pip install 'jupyterlab>=3.0.0,<4.0.0a0' && \
    jupyter serverextension enable --py jupyterlab && \
    pip install jupyterlab_vim && \
    pip install jupyterlab-lsp && \
    pip install python-language-server[all]

