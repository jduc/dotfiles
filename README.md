# dotfiles

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## Setup on a new machine

1. Install chezmoi:

   ```sh
   sh -c "$(curl -fsLS get.chezmoi.io)"
   ```

   (or `brew install chezmoi` on macOS)

2. Initialize from this repo and apply everything in one step:

   ```sh
   chezmoi init --apply github.com/jduc/dotfiles
   ```

   This clones the repo into `~/.local/share/chezmoi` and symlinks/copies the managed files into your home directory.

   To review changes before they're applied, drop `--apply` and run `chezmoi init github.com/jduc/dotfiles`, then follow the "Daily workflow" commands below.

## Daily workflow

All commands can be run from anywhere — chezmoi finds its source directory (`~/.local/share/chezmoi`) automatically.

### Edit an existing dotfile

```sh
chezmoi edit ~/.zshrc      # opens the source file in $EDITOR
chezmoi apply              # applies the change to ~/.zshrc
```

Or just edit the source file directly in this repo (e.g. `dot_zshrc`) and run `chezmoi apply` afterward.

### Add a new file to be managed

```sh
chezmoi add ~/.gitconfig
```

This copies `~/.gitconfig` into the source directory as `dot_gitconfig`. Commit it like any other file.

### Add a whole directory

```sh
chezmoi add ~/.config/some-tool
```

### Managing chezmoi's own config file

`chezmoi add ~/.config/chezmoi/chezmoi.toml` will fail — chezmoi refuses to manage its own config file directly. Instead, edit `.chezmoi.toml.tmpl` in the source directory (this repo's root) directly, e.g.:

```sh
nvim ~/.local/share/chezmoi/.chezmoi.toml.tmpl
```

It's automatically re-rendered into `~/.config/chezmoi/chezmoi.toml` the next time any chezmoi command runs, so no `apply` step is needed. Don't use `chezmoi edit-config` for this — that command opens the *rendered* `~/.config/chezmoi/chezmoi.toml` directly, and any edits made there get silently overwritten from the template on the next run.

### See what would change before applying

```sh
chezmoi diff
```

### Apply pending changes from the source directory

```sh
chezmoi apply
```

### Pull the latest dotfiles from git and apply them

```sh
chezmoi update
```

(equivalent to `git pull` inside the source dir + `chezmoi apply`)

### Go to the source directory

```sh
chezmoi cd
```

Drops you into `~/.local/share/chezmoi` (this repo) so you can use normal git commands (`git add`, `git commit`, `git push`).

## Typical loop

```sh
chezmoi edit ~/.zshrc      # edit a file
chezmoi diff                 # sanity check the change
chezmoi apply                # apply it locally
chezmoi cd                   # jump into the source repo
git add -A && git commit -m "update zshrc" && git push
```

On any other machine, run `chezmoi update` to pull and apply that change.

## Useful commands cheatsheet

| Command                       | What it does                                      |
| ------------------------------ | -------------------------------------------------- |
| `chezmoi add <file>`           | Start managing a file/directory                    |
| `chezmoi edit <file>`          | Edit the source file for a target                  |
| `chezmoi diff`                 | Preview changes that `apply` would make            |
| `chezmoi apply`                | Apply source changes to the home directory         |
| `chezmoi update`               | `git pull` + `apply`                               |
| `chezmoi cd`                   | Open a shell in the source directory               |
| `chezmoi status`               | Show files that differ between source and target   |
| `chezmoi managed`              | List all files chezmoi manages                     |
| `chezmoi unmanage <file>`      | Stop managing a file (leaves it in place on disk)  |
| `chezmoi re-add`               | Pull local edits of a managed file back into source |
