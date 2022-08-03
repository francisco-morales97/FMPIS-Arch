# Afetch
afetch

# Variables de color
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# Sección de atajos de teclado
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"
key[Control-Left]="${terminfo[kLFT5]}"
key[Control-Right]="${terminfo[kRIT5]}"

## Configura teclas acorde a lo anterior
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"     overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"     delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"       backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"      forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete
[[ -n "${key[Control-Left]}"  ]] && bindkey -- "${key[Control-Left]}"  backward-word
[[ -n "${key[Control-Right]}" ]] && bindkey -- "${key[Control-Right]}" forward-word

## Asegurarse de que la terminal esté en modo aplicación
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

# Sección de aliases
alias matrix="cmatrix -ab"
alias ls="ls --color=always"
alias grep="grep --color=always"
alias mpv="mpv --profile=480p"
alias etags="EDITOR=$EDITOR opustags --in-place --edit"
alias gs="cd /opt/lampp/htdocs/geoservice/"
alias u="cd ~/Documentos/Inacap/'4to Semestre'/"
alias t="cd ~/Documentos/'Proyectos Web Personales'/Geoservice"
alias anime="ani-cli"
alias mirror-refresh="sudo reflector --verbose --score 100 -l 50 -f 10 --sort rate --save /etc/pacman.d/mirrorlist"
alias tunel-geosrv="ssh -v -N -D localhost:1080 tunel@geosysrv.noip.me -p 10"
alias mc="sudo java -jar $HOME/TLauncher/TLauncher-2.839.jar"
alias monitor="gotop -l layout"
alias peli="mpv ~/Descargas/Fantastic.Beasts.The.Secrets.of.Dumbledore.2022.1080p.KORSUB.HDRip.x264.AAC2.0-SHITBOX/Fantastic.Beasts.The.Secrets.of.Dumbledore.2022.1080p.KORSUB.HDRip.x264.AAC2.0-SHITBOX.mp4 --sub-pos=84 --sub-font-size=45 --sub-back-color=0/0/0/0.9"
alias retroarch="powerprofilesctl launch org.libretro.RetroArch & monitor"
alias dolphin="powerprofilesctl launch dolphin-emu"

# Zsh history
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=$XDG_CACHE_HOME/zsh/history

# Zsh completions
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION

# Zsh autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Zsh syntax highlight
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Starship
eval "$(starship init zsh)"
