# ignore non-interactive shells
case $- in
*i*) ;;
*) return ;;
esac

. ~/.cfg/.completion
. ~/.cfg/.flutter

. ~/.cfg/.gcc
. ~/.cfg/.history

. ~/.cfg/.nvm
. ~/.cfg/.pipx

. ~/.cfg/.terminal
. ~/.bash_aliases
