FROM ubuntu:24.04

RUN apt update -y && apt upgrade -y && \
     apt install -y vim less tree git curl wget build-essential gcc libssl-dev pkg-config && \
     curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
RUN echo 'export PATH="/root/.cargo/bin:$PATH"' >> /root/.bashrc

# setup vim
RUN mkdir -p /root/.vim/colors
COPY despacio.vim /root/.vim/colors/
COPY .vimrc /root/

# setup
# setup git completion/prompt
RUN wget -P /usr/local/src/ https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh && \
    wget -P /usr/local/src/ https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash

RUN <<EOF
cat <<_DOC_ >> /root/.bashrc
if [ -f /usr/local/src/git-completion.bash ]; then
    source /usr/local/src/git-completion.bash
fi
if [ -f /usr/local/src/git-prompt.sh ]; then
    source /usr/local/src/git-prompt.sh
fi
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto
export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\n\$ '
_DOC_
EOF

#RUN mkdir -p /workplace
WORKDIR /workplace
