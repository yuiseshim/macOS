# .bash_profile
# by login

# --- .zprofile ---
# ログインシェル向け: ログイン時に1度だけ読み込まれる（環境変数など）

# 1. ログイン時のみの環境変数
export PATH="/usr/local/sbin:$PATH"
export TZ='Asia/Tokyo'

# 2. SSH Agentの起動
if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s`
fi

# 3. X11関連（必要なら）
# export DISPLAY=:0

# 4. 他のファイルの読み込み（必要に応じて）
# [ -f ~/.zshenv ] && source ~/.zshenv


if [ -f ~/.zshrc ] ; then
. ~/.zshrc
fi

# Setting Japanese Font                                                                             
export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8

#Colors
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

export EDITOR=emacs

# API KEY
if [ -f $HOME/Desktop/.bash_mykey ] ; then
    . $HOME/Desktop/.bash_mykey
fi

## Set path for pyenv
export PYENV_ROOT="$HOME/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
    if command -v pyenv 1>/dev/null 2>&1; then
	export PATH="$PYENV_ROOT/bin:$PATH"
	eval "$(pyenv init --path)"
	eval "$(pyenv virtualenv-init -)"
    fi
fi

export PYTHONPATH=$PYTHONPATH:"$HOME/Desktop"
#export PYTHONPATH=$PYTHONPATH:`pwd`:`pwd`/slim

#PS1=`echo '$PYENV_VERSION'`"|\u@\h \W>$"

# 2019.7.3 for gcloud
export CLOUDSDK_PYTHON=/Users/$USER/.pyenv/versions/2.7.16/bin/python2
export GOOGLE_APPLICATION_CREDENTIALS=$HOME/.config/gcloud/GOOGLE_APPLICATION_CREDENTIALS/MyWorks-6a3d4ffd7dd6.json

# 2019.10.13 for Catalina update
export PATH="/usr/local/sbin:$PATH"

export WEBHOOK_URL='https://hooks.slack.com/services/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'
