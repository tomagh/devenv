
local script_dir=${0:A:h}

tgh_xc_buildsettings_normalized() {
    swift run --package-path "$script_dir/tgh_xc_buildsettings"
}