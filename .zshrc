# .bashrc
# by boot shell

# --- .zshrc ---
# インタラクティブシェル向け: ターミナルを開いたときに毎回読み込まれる

# 1. 環境変数の設定（必要に応じて）
export EDITOR='vim'
export LANG='ja_JP.UTF-8'

# 2. パスの追加
export PATH="$HOME/bin:$PATH"

# 3. エイリアス（別ファイルで管理する場合は後述）
if [ -f "$HOME/.zsh_aliases" ]; then
  source "$HOME/.zsh_aliases"
fi

# 4. プロンプトのカスタマイズ（例）
PROMPT='%n@%m:%~%# '

# 5. プラグイン・補完の設定例
# eval "$(zoxide init zsh)"   # zoxide使う場合
# source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# 6. その他の設定
setopt autocd              # ディレクトリ名だけでcd
setopt correct             # コマンドのタイプミス補完
setopt hist_ignore_dups    # 重複した履歴を記録しない



function jslide() {
    jupyter nbconvert --to slides $1 --post serve
}
export PATH=$HOME/.nodebrew/current/bin:$PATH

# pyenv
#eval "$(pyenv init -)"
