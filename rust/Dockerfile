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
RUN echo "if [ -f /usr/local/src/git-completion.bash ]; then" >> /root/.bashrc && \
    echo "    source /usr/local/src/git-completion.bash" >> /root/.bashrc && \
    echo "fi" >> /root/.bashrc && \
    echo "if [ -f /usr/local/src/git-prompt.sh ]; then" >> /root/.bashrc && \
    echo "    source /usr/local/src/git-prompt.sh" >> /root/.bashrc && \
    echo "fi" >> /root/.bashrc && \
    echo "GIT_PS1_SHOWDIRTYSTATE=true" >> /root/.bashrc && \
    echo "GIT_PS1_SHOWUNTRACKEDFILES=true" >> /root/.bashrc && \
    echo "GIT_PS1_SHOWSTASHSTATE=true" >> /root/.bashrc && \
    echo "GIT_PS1_SHOWUPSTREAM=auto" >> /root/.bashrc && \
    echo "PS1='[\[\033[32m\]\u@\h\[\033[00m\] \[\033[33m\]\w\[\033[1;36m\]\$(__git_ps1 \" (%s)\")\[\033[00m\]]\n\$ '" >> /root/.bashrc

#RUN mkdir -p /workplace
WORKDIR /workplace
