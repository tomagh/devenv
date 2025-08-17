TGH_GIT_MIRROR_ROOT=${TGH_GIT_MIRROR_ROOT:-"$HOME/github.com-mirrors"}

_tgh_git_clone() {
    [[ -z $1 ]] && {
        echo "❌ No repository specified to sync."
        echo "Usage: _tgh_git_clone <org/repo> [...]"
        echo "Example: _tgh_git_clone tomagh/devenv"
        echo "This will call _tgh_git_mirror_sync \$1; git clone --reference \"\$TGH_GIT_MIRROR_ROOT/tomagh/devenv.git\" \"https://github.com/tomagh/devenv.git\""
        return 64  # EX_USAGE
    }

    local repo="$(_tgh_git_parse_repo_parameter "$1")"; shift
    shift

    # Sync existing mirror before clone
    _tgh_git_mirror_sync "$repo"

    # Clone from mirror saving remote
    local mirror="$TGH_GIT_MIRROR_ROOT/$repo.git"
    local remote="https://github.com/$repo.git"
    git clone --reference "$mirror" "$remote" "$@"
}