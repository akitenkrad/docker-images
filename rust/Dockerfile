FROM ubuntu:24.04

RUN apt update -y && apt upgrade -y && \
     apt install -y vim less tree git curl wget build-essential gcc && \
     curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
RUN echo 'export PATH="/root/.cargo/bin:$PATH"' >> /root/.bashrc

# setup vim
RUN mkdir -p /root/.vim/colors
COPY despacio.vim /root/.vim/colors/
COPY .vimrc /root/

# setup
# git branch dispaly
COPY .git-prompt.sh /root/
COPY .git-completion.bash /root/
RUN echo 'if [ -f ~/.git-completion.bash ]; then\n\
    source ~/.git-completion.bash\n\
fi\n\
if [ -f ~/.git-prompt.sh ]; then\n\
    source ~/.git-prompt.sh\n\
fi\n\
GIT_PS1_SHOWDIRTYSTATE=true\n\
GIT_PS1_SHOWUNTRACKEDFILES=true\n\
GIT_PS1_SHOWSTASHSTATE=true\n\
GIT_PS1_SHOWUPSTREAM=auto\n\
PS1='\''[\[\033[32m\]\u@\h\[\033[00m\] \[\033[33m\]\w\[\033[1;36m\]$(__git_ps1 " (%s)")\[\033[00m\]]\n\$ '\''' >> /root/.bashrc

