cd ~/;

# create .bashrc
if ! test -f  ~/.bashrc ; then 
    touch ~/.bashrc;
    echo 'created bashrc file';
    source ~/.bashrc;
fi

# create .zshrc
if ! test -f  ~/.zshrc ; then 
    touch ~/.zshrc;
    echo 'created zshrc file';
    source ~/.zshrc;
fi

# create .bash_profile
if ! test -f  ~/.bash_profile ; then 
    touch ~/.bash_profile;
    echo 'created zshrc file';
    source ~/.bash_profile;
fi

# create alias
if ! type ll ; then 
    echo "
alias ll='ls -la';
alias ga='git add .';
alias gc='git commit -m';
alias gr='git reset --hard HEAD~1';
alias gs='git status';
alias uter='source ~/.bashrc; source ~/.zshrc; source ~/.bash_profile;'
    " >> ~/.bashrc;
    source ~/.bashrc; 
    source ~/.zshrc;
    source ~/.bash_profile;
    echo "Created alias";
fi

# Install Homebrew
if ! type brew ; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "brew not installed";
    uter
fi

if ! type wget ; then 
    brew install wget
fi

if ! type ohmyzsh ; then
    # sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   echo "alias ohmyzsh='echo installed';" >> ~/.bashrc;
fi


# Install warp terminal
if ! type warp ; then
    brew install --cask warp;
    echo "warp installed";
    echo "alias warp='open -a warp';" >> ~/.bashrc;
    uter
fi

# Install NVM node JS
if ! type nvm ; then
    brew install nvm;
    mkdir ~/.nvm
    export NVM_DIR="$HOME/.nvm"
    . "/usr/local/opt/nvm/nvm.sh"
    uter

    echo "
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && \. "/usr/local/opt/nvm/etc/bash_completion"
    " >> ~/.bash_profile;
    uter

    nvm install 18.18.0;
    echo "node 18.18.0 installed";
    uter
    
    nvm install 14.21.3;
    echo "node 14.21.3 installed";
    uter

    nvm use 14.21.3
    uter
fi


# is the finihed
echo "finished";
# exist;
