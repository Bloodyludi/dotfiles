# .dotfiles

These are my dotfiles. Take anything you want at your own risk.
Currently only for MacOS.

## 1. Install Apple Command Line Tools

Apple command line tools are required for git and Homebrew:

`xcode-select --install`

## 2. Generate a new .ssh key for use with github

Generate a new ssh-key:

`ssh-keygen -t ed25519 -C "your@email.com"`

Update `~/.ssh/config` :

```
Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
```

Add private key to ssh-agent:

`ssh-add -K ~/.ssh/id_ed25519`

Add ssh key to your account on github: "[Adding a new SSH key to your GitHub account](https://docs.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account)."

## 3. Clone dotfiles repo into ~/.dotfiles

Clone this repo into `~/.dotfiles` :

`git clone git@github.com:Bloodyludi/dotfiles.git ~/.dotfiles`

## 4. Run setup script

Navigate to `~/.dotfiles` and run: 

`setup-macos`
