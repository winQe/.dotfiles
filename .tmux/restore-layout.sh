#!/usr/bin/env bash
# Snap the current window back to the default worktrunk layout:
#   nvim as the big pane on the left (main-vertical, ~75% wide),
#   the remaining panes (claude, codex, extra terminals) stacked on the right.
#
# main-vertical always makes the FIRST pane in the window the main/left pane,
# so if an accidental reorganize moved nvim out of that slot we first swap nvim
# back into it, then apply the layout.

set -u

win="${1:-}"
[ -n "$win" ] || win="$(tmux display-message -p '#{window_id}')"

# First pane in the window is the slot main-vertical promotes to the left.
first="$(tmux list-panes -t "$win" -F '#{pane_index}' | head -n1)"

# Prefer the focused pane if it is (n)vim, otherwise the first (n)vim pane.
active_cmd="$(tmux display-message -p -t "$win" '#{pane_current_command}')"
active_idx="$(tmux display-message -p -t "$win" '#{pane_index}')"
case "$active_cmd" in
  *vim) nvim="$active_idx" ;;
  *)    nvim="$(tmux list-panes -t "$win" -f '#{m:*vim,#{pane_current_command}}' -F '#{pane_index}' | head -n1)" ;;
esac

# Move nvim into the main slot if it isn't already there.
if [ -n "$nvim" ] && [ "$nvim" != "$first" ]; then
  tmux swap-pane -d -s "${win}.${nvim}" -t "${win}.${first}"
fi

# 75% left pane matches worktrunk's `split-window -h -p 25` right column.
tmux set-window-option -t "$win" main-pane-width 75%
tmux select-layout -t "$win" main-vertical
tmux select-pane -t "${win}.${first}"
