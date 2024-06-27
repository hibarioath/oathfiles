if status is-interactive
    # Commands to run in interactive sessions can go here
end
alias nyx='sudo vim /etc/nixos/configuration.nix'
alias nixch='sudo nixos-rebuild switch'
alias nixup='sudo nixos-rebuild switch --upgrade'
alias etctogit='sudo cp -rfv /etc/nixos/* ~/nixoath/'
alias nixtrash='sudo nix-collect-garbage'
alias poweroff='sudo nixos-rebuild switch --upgrade; shutdown now'

alias sourcefish='source ~/.config/fish/config.fish'

alias flatup='flatpak update'
alias suck='sudo make clean install'
