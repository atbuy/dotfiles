# dotfiles

These are personal configuration files for applications.

## Usage

- Clone the repository into `~/dotfiles`

```bash
git clone https://github.com/atbuy/dotfiles.git ~/dotfiles
```

- Go into the directory

```bash
cd ~/dotfiles
```

- Use `stow` to create symlinks for applications you want to use

Example:

```bash
stow nvim
```

You're done! :)

## Installation

### Dependencies

Some applications require extra setup and depend on other applications.

If you are using Arch you can use `sudo pacman -S <package-name>` for each of the dependencies declared here, unless stated otherwise (e.g. `... (git)`)

#### hyprland (hypr)

- `hyprland`
- `brightnessctl`
- `playerctl`
- `slurp`
- `grim`
- `wl-clipboard`
- `swaybg`
- `hyprlock`
- `ttf-jetbrains-mono`
- `ttf-ubuntu-mono-nerd`

#### kitty

- `kitty`
- `ttf-font-awesome`
- `ttf-ubuntu-mono-nerd`

#### neofetch

- `neofetch`

#### nvim

- `neovim`
- `nodejs` (preferably using `nvm`, make sure to also set a global version)
- `ripgrep`

- Go into neovim

```bash
nvim
```

- Run the custom command for `Mason` to install all the required packages

```bash
:MasonInstallAll
```

#### tmux

- `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm` (git)
- `git clone https://github.com/tmux-plugins/tmux-continuum.git` (git)

- After installing dependencies, go into a new tmux session

```bash
tmux new-session
```

- Install packages through tmux plugin manager using `ctrl+space` and then `shift+i`

#### waybar

- `waybar`

#### wofi

- `wofi`

#### yazi

- `yazi`

#### .zsh_prompt (zsh_prompt)

- `zsh`
- `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"` (curl)
- `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions` (git)
- `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting` (git)

#### .zshrc (zshrc)

- The dependencies from above in `.zsh_prompt (zsh_prompt)`
- `neofetch`
- `curl https://pyenv.run | bash` (curl)
- `curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash` (curl)
