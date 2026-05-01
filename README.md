# dotfiles

Personal macOS dev setup. zsh + starship, Valet + DBngin for local WordPress.

## Fresh install

```sh
git clone https://github.com/<you>/.dotfiles.git $HOME/.dotfiles
export DOTFILES=$HOME/.dotfiles
sh $DOTFILES/fresh.sh
```

`fresh.sh` does:

- Symlinks `.zshrc` → `$DOTFILES/.zshrc`
- Copies `gitconfig` → `~/.gitconfig` (template, edit per-machine)
- Symlinks `starship.toml` → `~/.config/starship.toml`
- Installs Homebrew + everything in `Brewfile`
- Installs Valet via Composer
- Creates `~/Projects` and `~/Sites`
- Imports iTerm2 color scheme (manual profile selection after)

## Manual post-install

- **1Password**: sign in, enable "Use the SSH agent" in Developer settings.
- **Git signing**: in 1Password, "Configure Commit Signing" — adds signingkey + commit.gpgsign to `~/.gitconfig`.
- **iTerm2**: Preferences → Profiles → Colors → Color Presets → select `material-palette`.
- **iTerm2 font**: Preferences → Profiles → Text → Font → JetBrainsMono Nerd Font.
- **DBngin**: launch app, create a MySQL 8 instance on port 3306.

## Commands

- `wpsite <name>` — scaffold a WordPress site at `~/Projects/<name>` linked via Valet at `<name>.test`.
- `wpremove <name>` — drop the DB and remove the site.

## Layout

| File | Purpose |
|---|---|
| `.zshrc` | shell entry point (symlinked) |
| `path.zsh` | PATH exports (sourced by `.zshrc`) |
| `aliases.zsh` | shell aliases (sourced by `.zshrc`) |
| `gitconfig` | git template (copied, not symlinked) |
| `starship.toml` | prompt config (symlinked) |
| `Brewfile` | brew bundle |
| `fresh.sh` | bootstrap script |
| `bin/setup.sh` | invoked by `wpsite` alias |
| `bin/remove.sh` | invoked by `wpremove` alias |
| `material-palette.itermcolors` | iTerm2 color scheme — modified [Material Design Colors](https://github.com/mbadolato/iTerm2-Color-Schemes/blob/master/schemes/Material%20Design%20Colors.itermcolors) using canonical [Material Design](https://m2.material.io/design/color/the-color-system.html) swatches (Blue Grey 900 bg, A200 accents). |
