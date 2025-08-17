TGH_GIT_MIRROR_ROOT=${TGH_GIT_MIRROR_ROOT:-"$HOME/github.com-mirrors"}

_tgh_git_mirror_sync() {
    [[ -z $1 ]] && {
        echo "❌ No repository specified to sync."
        echo "Usage: _tgh_git_mirror_sync <org/repo>"
        echo "Example: _tgh_git_mirror_sync tomagh/devenv"
        echo "This will update the existing or create new mirror for the https://github.com/tomagh/devenv.git to \$TGH_GIT_MIRROR_ROOT/tomagh/devenv.git"
        return 64  # EX_USAGE
    }

    local repo="$(_tgh_git_parse_repo_parameter "$1")"

    local mirror="$TGH_GIT_MIRROR_ROOT/$repo.git"
    local remote="https://github.com/$repo.git"

    if [[ -d $mirror ]]; then
        echo "🔄 Updating mirror: $mirror"
        # if ! git -C "$mirror" remote update --prune; then # - alternate approach
        if ! git -C "$mirror" fetch --all --prune; then
            echo "⚠️  Failed to update mirror: $mirror. Trying to clone it again."
            rm -rf "$mirror"
        fi
    fi

    if [[ ! -d $mirror ]]; then
        mkdir -p "$mirror"
        echo "✳️  Cloning mirror: $mirror"
        if ! git -C "$mirror" clone --mirror "$remote" "$mirror"; then
            echo "❌ Failed to clone repo $remote to $mirror"
            return 1
        fi
    fi
}
