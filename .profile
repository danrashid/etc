echo '.profile loaded'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export EDITOR=nano

alias ls="ls -G"
alias ll="ls -hal"
alias mydiff="mysqldump --skip-triggers --compact --extended-insert=FALSE -tcu root"
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

alias gvm_start="VBoxManage startvm BrightTag12.04.4 --type headless"
alias gvm_stop="VBoxManage controlvm BrightTag12.04.4 savestate"

function scrub() {
  chmod -R 755 "$1"
  find "$1" -type f -exec chmod 644 {} \;
  find "$1" -depth -name "._*" -exec rm {} \;
  find "$1" -depth -name ".DS_Store" -exec rm {} \;
}

function ssj() {
  n=${1:-3}
  scp jenkins:"`ssh jenkins ls -1td /mnt/cadence/ci/screenshots/\* | head -$n | tr '\n' ' '`" ~/Desktop/
  open `ls -1td ~/Desktop/*.png | head -$n`
}

function pull() {
  pushd .
  cd ~/dev/brighttag
  for dir in `ls -d */`
  do
    cd "~/dev/brighttag/$dir"
    git checkout master
    git pull
  done
  popd
}
