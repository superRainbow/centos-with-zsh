FROM centos

RUN yum install -y sudo
RUN sudo yum install -y wget git vim zsh
RUN wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
RUN git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
RUN git clone git://github.com/powerline/fonts ~/.powerline_fonts
RUN ~/.powerline_fonts/install.sh
RUN sed -i 's/ZSH_THEME=\".*.\"/ZSH_THEME=\"powerlevel10k\/powerlevel10k\"/g' ~/.zshrc

CMD ["/bin/zsh"]
