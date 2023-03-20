git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.3
echo "if status is-interactive
    source ~/.asdf/asdf.fish
    # Commands to run in interactive sessions can go here
end" > ~/.config/fish/config.fish
. "$HOME/.asdf/asdf.sh"
asdf plugin-add nodejs
asdf install nodejs 18.8.0
asdf global nodejs 18.8.0
