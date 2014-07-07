#!/bin/sh
git config --global user.name quiwamu
git config --global core.editor vim
#git config --global --unset core.editor //設定の削除
git config --global color.ui true
#git diffなどで改行表示する場合
git config --global core.pager "less -r"
git config --global --list

