# emacs-vterm
if [ -n "$INSIDE_EMACS" ]; then
    alias vi='emacsclient -n'
    alias vim='emacsclient -n'
    alias emacs="emacsclient -n"
fi

alias e="emacsclient -n"

if [ -d "$HOME/spacemacs" ] && \
   [ -f "$HOME/.emacs-profiles.el" ] && \
   [ -f "$HOME/.emacs" ]; then
    alias spacemacs="/Applications/Emacs.app/Contents/MacOS/Emacs --with-profile=spacemacs &"
fi