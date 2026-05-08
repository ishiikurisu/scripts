FROM archlinux:base

RUN yes | pacman -Syu 
RUN yes | pacman -S git neovim tmux jdk-openjdk w3m

COPY .tmux.conf /root/.tmux.conf
COPY .bashrc /root/.bashrc
COPY plug.vim /root/.local/share/nvim/site/autoload/plug.vim
COPY init.vim /root/.config/nvim/init.vim
COPY brogrammer.vim /root/.config/nvim/colors/

