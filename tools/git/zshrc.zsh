_tgh_git_parse_repo_parameter() {
    TGH_GIT_DEFAULT_GITHUB_USER=${TGH_GIT_DEFAULT_GITHUB_USER:-"tomagh"}
    case $1; in
        *"/"*) echo $@ ;;
        *) echo "$TGH_GIT_DEFAULT_GITHUB_USER/$@"
    esac
}

source "${0:A:h}/mirror.zsh"
source "${0:A:h}/clone.zsh"
