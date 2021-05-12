#!/bin/bash

VIMRC=~/.vimrc
TMUXCONF=~/.tmux.conf
TMPERROR=/tmp/.tmp_conf_install.log

setup_color() {
    # Only use colors if connected to a terminal
    if [ -t 1 ]; then
        RED=$(printf '\033[31m')
        GREEN=$(printf '\033[32m')
        YELLOW=$(printf '\033[33m')
        BLUE=$(printf '\033[34m')
        BOLD=$(printf '\033[1m')
        RESET=$(printf '\033[m')
    else
        RED=""
        GREEN=""
        YELLOW=""
        BLUE=""
        BOLD=""
        RESET=""
    fi
}

error() {
    if [ $1 -ne 0 ]; then
        echo ${RED}"ERROR: `cat ${TMPERROR}`"${RESET} >&2
        rm -rf $TMPERROR
        exit 1
    fi
}

init() {
    if [ ! -f "$TMPERROR" ]; then
        touch $TMPERROR
    fi
    setup_color
}

end_install() {
    rm -rf $TMPERROR
}

function install_onmyzsh() {
    echo "${GREEN}Install oh my zsh...${RESET}"
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    error $?
    echo "${GREEN}Install oh my zsh end${RESET}"
}
function install_p10k() {
    echo "${GREEN}Install p10k theme...${RESET}"
    git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    error $?
    echo "${GREEN}Install p10k theme end${RESET}"
}
function install_tmux_resurrect() {
    echo "${GREEN}Install tmux-resurrect...${RESET}"
    git clone https://github.com/tmux-plugins/tmux-resurrect ~/.tmux/plugins/tmux-resurrect
    error $?
    echo "${GREEN}Install tmux-resurrect end${RESET}"
}

init

if [ -f "$VIMRC" ]; then
    cp $VIMRC ${VIMRC}_`date +%Y-%m-%d:%H:%M:%S`
fi

if [ -f "$TMUXCONF" ]; then
    cp $TMUXCONF ${TMUXCONF}_`date +%Y-%m-%d:%H:%M:%S`
fi

echo "${GREEN}Cloning vimrc...${RESET}"
curl -fsS -o $VIMRC https://raw.githubusercontent.com/middzwb/my-config/master/vimrc 1>/dev/null 2>$TMPERROR
error $?
echo "${GREEN}Cloning vimrc end${RESET}"

echo "${GREEN}Cloning tmux config...${RESET}"
curl -fsS -o $TMUXCONF https://raw.githubusercontent.com/middzwb/my-config/master/tmux.conf 1>/dev/null 2>$TMPERROR
error $?
echo "${GREEN}Cloning tmux config end${RESET}"

# vim-plug install
echo "${GREEN}Cloning vim-plug...${RESET}"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 1>/dev/null 2>$TMPERROR
error $?
echo "${GREEN}Cloning vim-plug end${RESET}"

while getopts "to" op; do
    case ${op} in
        t)
            install_tmux_resurrect
            ;;
        o)
            install_onmyzsh
            install_p10k
            ;;
        ?)
            echo "unknown option"
            ;;
    esac
done

end_install
