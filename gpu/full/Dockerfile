FROM akitenkrad/python:gpu.base

WORKDIR /root
RUN apt update -y && apt install -y tzdata && apt upgrade -y

# install wireshark tshark
RUN DEBIAN_FRONTEND=noninteractive apt install -y tshark

# install texlive
RUN wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz && \
    tar xvf install-tl-unx.tar.gz && \
    cd install-tl-2* && \
    yes I | ./install-tl -no-gui && \
    /usr/local/texlive/2021/bin/x86_64-linux/tlmgr path add
COPY .latexmkrc /root/

# install utatane font for tex
COPY Utatane_v1.0.8/vf/ /root/.texlive2021/texmf-config/fonts/vf/
COPY Utatane_v1.0.8/tfm/ /root/.texlive2021/texmf-config/fonts/tfm/
COPY Utatane_v1.0.8/enc/ /root/.texlive2021/texmf-config/fonts/enc/
COPY Utatane_v1.0.8/map/ /root/.texlive2021/texmf-config/fonts/map/

# install jupyterlab
RUN pip install --upgrade pip
RUN pip install -U jupyterlab_widgets ipywidgets
RUN pip install 'jupyterlab>=3.0.0,<4.0.0a0' && \
    jupyter serverextension enable --py jupyterlab && \
    pip install jupyterlab_vim && \
    pip install jupyterlab-lsp && \
    pip install python-language-server[all]

