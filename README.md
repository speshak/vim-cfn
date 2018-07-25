# vim-cfn

## Description

This is a vim plugin that provides CloudFormation syntax checking/highlighting.
This requires the [Syntastic](https://github.com/vim-syntastic/syntastic)
plugin.

## Install

### Install with [vundle](https://github.com/VundleVim/Vundle.vim)

Add to your ~/.vimrc:

```
Plugin 'speshak/vim-cfn'
```

Then run

```
vim +PluginInstall +qall
```

## Configure
Add the following to `~/.vim/after/plugin/syntastic.vim`:

```
let g:syntastic_cloudformation_checkers = ['cfn_lint']
```
