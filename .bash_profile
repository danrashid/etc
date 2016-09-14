if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

export NVM_DIR="/Users/drashid/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export SHELL_SESSION_HISTORY=0
export PS1='\h:\W \u$(__git_ps1)\$ '
export EDITOR=nano

alias ls="ls -G"
alias ll="ls -hal"
alias mydiff="mysqldump --skip-triggers --compact --extended-insert=FALSE -tcu root"
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

alias cad="cd ~/dev/brighttag/cadence/ui/"
alias cuke="TESTENV=vagrant_hybrid BROWSER=chrome SKIPRESET=true cucumber --tags ~@wip"
alias json="python -m json.tool"

function scrub() {
  chmod -R 755 "$1"
  find "$1" -type f -exec chmod 644 {} \;
  find "$1" -depth -name "._*" -exec rm {} \;
  find "$1" -depth -name ".DS_Store" -exec rm {} \;
}

function pull() {
  pushd .
  for dir in `ls -d ~/dev/brighttag/*`
  do
    cd $dir
    git checkout master
    git pull
  done
  popd
}
