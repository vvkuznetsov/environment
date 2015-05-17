[[ -s "$HOME/.bash_profile" ]] && source "$HOME/.bash_profile"

# Promt
function _update_ps1() {
  export PS1="$(~/powerline-shell/powerline-shell.py $? 2> /dev/null)"
}

export PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH=/usr/local/bin:$PATH

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
 export LESS='-F -g -i -M -R -S -w -X -z-4'



 export NVM_DIR="/Users/vvkuznetsov/.nvm"
 [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

 #
 # Sencha
 #
 
 export PATH=/Users/vvkuznetsov/bin/Sencha/Cmd/5.1.2.52:$PATH
 export SENCHA_CMD_3_0_0="/Users/vvkuznetsov/bin/Sencha/Cmd/5.1.2.52"

 # Add 'xsh' to the path, so you can run it from any directory
 export PATH=$PATH:/Users/vvkuznetsov/projects/xiki/bin

 #
 # Docker
 #
 

 export DOCKER_HOST=tcp://192.168.59.103:2376
 export DOCKER_CERT_PATH=/Users/vvkuznetsov/.boot2docker/certs/boot2docker-vm
 export DOCKER_TLS_VERIFY=1

 #
 # ORACLE
 #
 
 export ORACLE_HOME="$HOME/oracle/instantclient_11_2_x64"
 export DYLD_LIBRARY_PATH=$ORACLE_HOME
 export LD_LIBRARY_PATH=$ORACLE_HOME

 #
 # Virtualenv
 #
 
 export WORKON_HOME=$HOME/.virtualenvs
 export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
 alias on='workon'

 VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
 source $VIRTUALENVWRAPPER_SCRIPT

 #
 # Directory Alias
 #
 
 alias work='cd ~/projects/start'
 alias optima='cd ~/projects/start/optima && workon optima'
 alias cm='cd ~/projects/start/cm && workon cm'

