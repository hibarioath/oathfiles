if [[ $- != *i* ]] ; then
	return
fi

alias emergeup="emerge -uNDq @world"
alias emergefull="emerge -uNDq @world && emerge -c && eclean distfiles && eclean packages"
alias emergeshutdown="emerge -uNDq @world && emerge -c && eclean distfiles && eclean packages && shutdown now"
# Añadir xcolor a $PATH
export PATH=/home/hibari/.cargo/bin:$PATH
# Luego añado el binario de xcolor (compilado
# con cargo según el GitHub con
# $PATH
# sudo cp xcolor /usr/bin/
fastfetch
fish
