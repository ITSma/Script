#!/bin/bash

HomeDIR=/home/$(whoami)

if [ $(pwd) != $HomeDIR ];then
	echo "不在用户目录下"
	cd $HomeDIR
fi

sudo touch .tmux.conf


(
cat << EOF
set -g default-terminal "screen-256color"
set -g display-time 3000
set -g history-limit 10000
set -g base-index 1
set -g pane-base-index 1
set -s escape-time 0
#set -g mouse on
#-- bindkeys --#
# split windows like vim.  - Note: vim's definition of a horizontal/vertical split is reversed from tmux's
#unbind s
#bind s split-window -v
#bind S split-window -v -l 40
#bind v split-window -h
#bind V split-window -h -l 120
# navigate panes with hjkl
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R
# key bindings for horizontal and vertical panes
unbind %
bind | split-window -h      # 使用|竖屏，方便分屏
unbind '"'
bind - split-window -v      # 使用-横屏，方便分屏
# swap panes
bind ^u swapp -U
bind ^d swapp -D
bind q killp
bind ^e last
unbind r
bind r source-file ~/.tmux.conf \; display "Configuration Reloaded!"
#-- statusbar --#
set -g status-justify centre
set -g status-left "#[fg=red]s#S:w#I.p#P#[default]"
set -g status-right '[#(whoami)#(date +" %m-%d %H:%M ")]'
set -g status-left-attr bright
set -g status-left-length 120
set -g status-right-length 120
set -g status-utf8 on
set -g status-interval 1
set -g visual-activity on
setw -g monitor-activity on
setw -g automatic-rename off
# default statusbar colors
set -g status-bg colour235 #base02
set -g status-fg colour136 #yellow
set -g status-attr default
# default window title colors
setw -g window-status-fg colour244
setw -g window-status-bg default
#setw -g window-status-attr dim
# active window title colors
setw -g window-status-current-fg colour166 #orange
setw -g window-status-current-bg default
#setw -g window-status-current-attr bright
# window title string (uses statusbar variables)
set -g set-titles-string '#T'
set -g status-justify "centre"
set -g window-status-format '#I #W'
set -g window-status-current-format ' #I #W '
# pane border
set -g pane-active-border-fg '#55ff55'
set -g pane-border-fg '#555555'
# message text
set -g message-bg colour235 #base02
set -g message-fg colour166 #orange
# pane number display
set -g display-panes-active-colour colour33 #blue
set -g display-panes-colour colour166 #orange
# clock
setw -g clock-mode-colour colour64 #green
# 修改进入命令模式按键
# remap prefix to Control + a
set -g prefix C-a
unbind C-b
bind C-a send-prefix
EOF
) > $HomeDIR/tmux.conf

#ls -a

mv -f tmux.conf .tmux.conf


