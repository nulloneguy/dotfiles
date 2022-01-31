# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="spaceship"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME="spaceship"
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(sudo fast-syntax-highlighting fzf-tab)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# fzf-tab
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'

# On-demand rehash
zshcache_time="$(date +%s%N)"

autoload -Uz add-zsh-hook

rehash_precmd() {
  if [[ -a /var/cache/zsh/pacman ]]; then
    local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
    if (( zshcache_time < paccache_time )); then
      rehash
      zshcache_time="$paccache_time"
    fi
  fi
}

add-zsh-hook -Uz precmd rehash_precmd

# omz
alias zshconfig="geany ~/.zshrc"
alias ohmyzsh="thunar ~/.oh-my-zsh"

# ls
alias l='ls -lh'
alias ll='ls -lah'
alias la='ls -A'
alias lm='ls -m'
alias lr='ls -R'
alias lg='ls -l --group-directories-first'

# git
alias gcl='git clone --depth 1'
alias gi='git init'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push origin master'

#!/usr/bin/zsh

# cat molot-tora.mp4 eraz.zip > data.mp4
# unzip date.mp4

# git.io custom url
# curl -i https://git.io -F "url=https://github.com/creio" -F "code=YOUR_CUSTOM_NAME"

alias sz="source $HOME/.zshrc"
alias ez="$EDITOR $HOME/.zshrc"
alias ea="$EDITOR $HOME/.alias_zsh"
alias merge="xrdb -merge $HOME/.Xresources"
alias xcolor="xrdb -query | grep"
alias vga="lspci -k | grep -A 2 -E '(VGA|3D)'"
alias upgrub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias updir="LC_ALL=C xdg-user-dirs-update --force"

alias dmrun="dmenu_run -l 10 -p 'run >' -fn 'ClearSansMedium 9' -nb '#282c37' -nf '#f2f3f4' -sb '#5a74ca' -sf '#fff'"

alias iip="curl --max-time 10 -w '\n' http://ident.me"
alias tb="nc termbin.com 9999 | xsel -b -i"
alias speed="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -"

# blur img: blur 4 .wall/wl3.jpg blur.jpg
blur() {
	convert -filter Gaussian -blur 0x$1 $2 $3
}

tbg() {
	urxvt -bg '[0]red' -b 0 -depth 32 +sb -name urxvt_bg &
}

# fzf
zzh() {
	du -a ~/ | awk '{print $2}' | fzf | xargs -r $EDITOR
}
zz() {
	du -a . | awk '{print $2}' | fzf | xargs -r $EDITOR
}
zzd() {
	du -a $1 | awk '{print $2}' | fzf | xargs -r $EDITOR
}
zzb() {
	find -H "/usr/bin" "$HOME/.bin" -executable -print | sed -e 's=.*/==g' | fzf | sh
}

alias bat="bat -p --color=always"

# зависимость source-highlight
hcat () {
	/usr/bin/src-hilite-lesspipe.sh "$1" | less -m -N
}
ccat () {
	cat "$1" | xsel -b -i
}

# share vbox В локальной машине mkdir vboxshare
# в виртуалке uid={имя пользователя} git={группа}
vboxshare () {
	[[ ! -d ~/vboxshare ]] && mkdir -p ~/vboxshare
	sudo mount -t vboxsf -o rw,uid=1000,gid=985 vboxshare vboxshare
	# sudo mount -t vboxsf -o rw,uid=st,gid=users vboxshare vboxshare
}
# share qemu
vmshare () {
	[[ ! -d ~/vmshare ]] && mkdir -p ~/vmshare
	sudo mount -t 9p -o trans=virtio,version=9p2000.L host0 vmshare
}

# aur pkg
amake () {
	git clone https://aur.archlinux.org/"$1".git
	# curl -fO https://aur.archlinux.org/cgit/aur.git/snapshot/"$1".tar.gz
	cd $1
	makepkg -s
	# makepkg -s --sign
	cd ..
}

# aur clean chroot manager
accm () {
	git clone https://aur.archlinux.org/"$2".git
	# curl -fO https://aur.archlinux.org/cgit/aur.git/snapshot/"$1".tar.gz
	# tar -xvf $1.tar.gz
	cd $2
	sudo ccm "$1"
	gpg --detach-sign "$2"-*.pkg*
	cd ..
}

# pkg clean chroot manager
lccm () {
	sudo ccm "$1"
	gpg --detach-sign *.pkg*
}

aget () {
	git clone https://aur.archlinux.org/"$1".git
	# curl -fO https://aur.archlinux.org/cgit/aur.git/snapshot/"$1".tar.gz
	# tar -xvf $1.tar.gz
	cd $1
}

# build and install pkg from aur
abuild () {
	cd ~/.build
	git clone https://aur.archlinux.org/"$1".git
	# curl -fO https://aur.archlinux.org/cgit/aur.git/snapshot/"$1".tar.gz
	# tar -xvf $1.tar.gz
	cd $1
	makepkg -si --skipinteg
	cd ~/
	# rm -rf ~/.build/$1 ~/.build/$1.tar.gz
	rm -rf ~/.build/$1
}


# alias neofetch="neofetch --ascii ~/.config/neofetch/ctlos"
alias neoa="neofetch --ascii ~/.config/neofetch/mario"
alias neo="neofetch --w3m ~/.config/neofetch/mmm.jpg"
# alias neo="neofetch --kitty ~/.config/neofetch/cn.jpg"
# alias neo="neofetch --w3m"

# Погода, не только по городу, но и по месту. Нет привязки к регистру и языку.
# alias wtr="curl 'wttr.in/Москва?M&lang=ru'"
# alias wtr="curl 'wttr.in/Москва?M&lang=ru' | sed -n '1,17p'"
# alias wtr="curl 'wttr.in/?M1npQ&lang=ru'"
wtr () {
	# curl "wttr.in/?M$1npQ&lang=ru"
	curl "wttr.in/Gomel?M$1npQ&lang=ru"
}
wts () {
	curl "wttr.in/$1?M&lang=ru"
}
alias moon="curl 'wttr.in/Moon'"

alias srm="sudo rm -rfv"
alias rm="rm -rfv"
crm () {
	# /bin/bash -c "yes | rm -rfv $1"{.\*\,\*}
	/bin/bash -c "rm -rfv $1{.*,*}"
}
scrm () {
	sudo /bin/bash -c "rm -rfv $1{.*,*}"
}

alias sl="exa --icons --sort type"
alias ls="exa --icons --sort type"
alias ll="exa --icons --long --sort type"
alias l="exa --icons --long --sort type"
alias tree="exa --icons --git -a --tree -s type -I '.git|node_modules|bower_components'"

alias grep="rg"
alias find="fd"

alias copy="xclip -sel clip"

alias mk="mkdir"
mkj() {
  mkdir -p "$@" && cd "$_" || exit;
}
fcd() {
  local dir
  dir=$(fd --type d --follow --hidden | fzf --preview 'tree -l -L 1 {}' +m) &&
  cd "$dir"
}
fkill() {
  local pid
  if [ "$UID" != "0" ]; then
    pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
  else
    pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
  fi

  if [ "x$pid" != "x" ]
  then
    echo "$pid" | xargs kill "-${1:-9}"
  fi
}

alias /="cd /"
alias ~="cd ~"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......='cd ../../../../..'
alias q="exit"

function gc () {
	git clone "$1" ${2}
}

function gcj () {
	git clone "$1"
	local to=$(echo ${1##*/}|sed 's/\..*//')
	cd $to
	# $EDITOR .
}
alias gi="git init"
alias gs="git status"
alias gl="git log --stat --pretty=oneline --graph --date=short"
alias ga="git add --all"
gac () {
	git add --all
	git commit -am "$1"
}
alias gr="git remote"
alias gf="git fetch"
alias gpl="git pull"
alias gp="git push"
alias gpm="git push origin master"

# youtube-dl --ignore-errors -o '~/Видео/youtube/%(playlist)s/%(title)s.%(ext)s' https://www.youtube.com/playlist?list=PL-UzghgfytJQV-JCEtyuttutudMk7
# Загрузка Видео ~/Videos или ~/Видео
# Пример: dlv https://www.youtube.com/watch?v=gBAfejjUQoA
dlv () {
	youtube-dl --ignore-errors -o '~/Videos/youtube/%(title)s.%(ext)s' "$1"
}
# dlp https://www.youtube.com/playlist?list=PL-UzghgfytJQV-JCEtyuttutudMk7
dlp () {
	youtube-dl --ignore-errors -o '~/Videos/youtube/%(playlist)s/%(title)s.%(ext)s' "$1"
}

# Загрузка аудио ~/Music или ~/Музыка
# Пример: mp3 https://www.youtube.com/watch?v=gBAfejjUQoA
mp3 () {
	youtube-dl --ignore-errors -f bestaudio --extract-audio --audio-format mp3 --audio-quality 0 -o '~/Music/youtube/%(title)s.%(ext)s' "$1"
}
# mp3p https://www.youtube.com/watch?v=-F7A24f6gNc&list=RD-F7A24f6gNc
mp3p () {
	youtube-dl --ignore-errors -f bestaudio --extract-audio --audio-format mp3 --audio-quality 0 -o '~/Music/youtube/%(playlist)s/%(title)s.%(ext)s' "$1"
}

alias mvis="ncmpcpp -S visualizer"
alias m="ncmpcpp"

alias wget="wget --no-hsts"
# download web site
wgetw () {
	wget -rkx "$1"
}
iso () {
	sudo dd bs=4M if="$1" of=/dev/"$2" status=progress && sync
}

alias -s {mp3,m4a,flac,mp4,mkv,webm}="mpv"
alias -s {png,jpg,tiff,bmp,gif}="viewnior"
alias -s {pdf}="xreader"
alias {aurman,pikaur,trizen,yaourt}="yay"

alias tm="tmux attach || tmux new -s work"
alias tmd="tmux detach"
alias tmk="tmux kill-server"
alias rr='ranger'
alias srr="sudo ranger"
alias h="htop"
alias {v,vi,vim,neovim}="nvim"

alias pkglist="pacman -Qneq > ~/.pkglist.txt"
alias aurlist="pacman -Qmeq > ~/.aurlist.txt"

alias pkey="sudo pacman-key --init && sudo pacman-key --populate && sudo pacman-key --refresh-keys --keyserver hkp://keys.gnupg.net && sudo pacman -Syy"
alias y="yay -S"
alias yn="yay -S --noconfirm"
alias yl="yay -S --noconfirm --needed - < ~/.pkglist.txt"
alias ys="yay"
alias ysn="yay --noconfirm"
alias yo="yay -S --overwrite='*'"
alias yU="yay -U"
alias yUo="yay -U --overwrite='*'"
alias yc="yay -Sc"
alias ycc="yay -Scc"
alias yy="yay -Syy"
alias yu="yay -Syyu"
alias yun="yay -Syyu --noconfirm"
alias yr="yay -R"
alias yrs="yay -Rs"
alias yrsn="yay -Rsn"
alias yrn="yay -R --noconfirm"
alias ynskip='yay --noconfirm --mflags "--nocheck --skipchecksums --skippgpcheck"'
alias yngpg='yay --noconfirm --gpgflags "--keyserver keys.gnupg.net"'

# top history
tophist() {
	cat ~/.zhistory \
		| cut -d ';' -f 2- 2>/dev/null \
		| awk '{a[$1]++ } END{for(i in a){print a[i] " " i}}' \
		| sort -rn \
		| head
}

# распаковать архив не указывая тип распаковщика
function ex {
	if [ -z "$1" ]; then
		# display usage if no parameters given
		echo "Использование: ex <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
	else
		if [ -f "$1" ] ; then
			NAME=${1%.*}
			#mkdir $NAME && cd $NAME
			case "$1" in
				*.tar.bz2)   tar xvjf ./"$1"    ;;
				*.tar.gz)    tar xvzf ./"$1"    ;;
				*.tar.xz)    tar xvJf ./"$1"    ;;
				*.lzma)      unlzma ./"$1"      ;;
				*.bz2)       bunzip2 ./"$1"     ;;
				*.rar)       unrar x -ad ./"$1" ;;
				*.gz)        gunzip ./"$1"      ;;
				*.tar)       tar xvf ./"$1"     ;;
				*.tbz2)      tar xvjf ./"$1"    ;;
				*.tgz)       tar xvzf ./"$1"    ;;
				*.zip)       unzip ./"$1"       ;;
				*.Z)         uncompress ./"$1"  ;;
				*.7z)        7z x ./"$1"        ;;
				*.xz)        unxz ./"$1"        ;;
				*.exe)       cabextract ./"$1"  ;;
				*)           echo "ex: '$1' - Не может быть распакован" ;;
			esac
		else
			echo "'$1' - не является допустимым файлом"
		fi
	fi
}

# Упаковка в архив командой pk 7z /что/мы/пакуем имя_файла.7z
function pk () {
	if [ $1 ] ; then
		case $1 in
			tbz)       tar cjvf $2.tar.bz2 $2      ;;
			tgz)       tar czvf $2.tar.gz  $2       ;;
			txz)       tar -caf $2.tar.xz  $2       ;;
			tar)       tar cpvf $2.tar  $2       ;;
			bz2)       bzip $2 ;;
			gz)        gzip -c -9 -n $2 > $2.gz ;;
			zip)       zip -r $2.zip $2   ;;
			7z)        7z a $2.7z $2    ;;
			*)         echo "'$1' не может быть упакован с помощью pk()" ;;
		esac
	else
		echo "'$1' не является допустимым файлом"
	fi
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
