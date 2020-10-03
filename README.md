# Auto-cd

I find really useful while working on a project to open many shells in the same
folder and is really annoying for each of them to `cd` in that folder, even 
using the awesome `z` plugin.

`auto-cd` simply remembers the last `cd` you have done and when you will open a
new shell it will automatically `cd` into it.

## Install

- manual installation in oh-my-zsh

To manually install in oh-my-zsh you need to download and copu inside 
`$ZSH_CUSTOM/plugins`

```zsh
git clone https://github.com/andreaconti/auto-cd $ZSH_CUSTOM/auto-cd
```
Then activate in your `.zshrc`.

```zsh
plugins=(auto-cd)
```

- antigen

Installing using antigen is quite simple:

```zsh
antigen bundle andreaconti/auto-cd
```

## Options

`auto-cd` provided few options:

- AUTO_CD_HOME, the default folder into which to jump if there is no previous `cd`
- AUTO_CD_NO_AUTO_LS, bool, if true disables auto-ls once entered in the new folder
