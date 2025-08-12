zparseopts -D -E f=flag_f

local DST_PATH="$HOME/.wezterm.lua"
if [[ -L "$DST_PATH" ||  -e "$DST_PATH" ]]; then
    if [[ -n "$flag_f" ]]; then
        echo "Forcing symlink creation, existing file  ~/.wezterm.lua will be overwritten."
    else
        echo "File ~/.wezterm.lua already exists. Do you want to overwrite it? (y/N)"
        read -r answer
        if [[ "$answer" != "y" ]]; then
            echo "Skipping symlink creation."
            exit 0
        fi
    fi
    rm -f "$HOME/.wezterm.lua"
fi

ln -s "${0:A:h}/.wezterm.lua" "$HOME/.wezterm.lua"
