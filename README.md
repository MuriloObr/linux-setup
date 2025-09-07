# MuriloObr Linux Setup
I made this repository because i am wanted a custom linux setup and don't want to remember ever part of the steps i'll explain here.
> `setup.sh` is currently not functional, so do not use until these message is removed.

#### Install Archlinux
> I use arch btw

I haven't done this step again, so maybe next time i'll try [Omarchy](https://omarchy.org/). Considering you've sudo, curl, git and other core pckgs set go to next step.

#### Better shell

Install zsh and [starship](https://starship.rs/) (read the starship docs and make your own customization).
```shell
sudo pacman -S zsh starship
```

Install [oh-my-zsh](https://ohmyz.sh).
```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

#### Development envinronment

I'll recommend installing [yay](https://github.com/Jguer/yay) for the next steps, because building from source may be slow and overwelm the process (do at your own risk).

```shell
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si
```

Install [neovim](https://neovim.io/) and [tmux](https://github.com/tmux/tmux/wiki).
```shell
sudo pacman -S vim neovim tmux
```
Clone [tpm](https://github.com/tmux-plugins/tpm) (tmux-plugin-manager)
```shell
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
My `.tmux.conf`
```tmux
set -g @plugin 'tmux-plugins/tpm'

run '~/.tmux/plugins/tpm/tpm'
```

