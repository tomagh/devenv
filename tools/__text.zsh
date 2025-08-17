
__print_styles_and_colors() {
  local -A styles=(
    [0]="Reset"
    [1]="Bold"
    [2]="Dim"
    [3]="Italic (not supported everywhere)"
    [4]="Underline"
    [5]="Blink (not supported everywhere)"
    [7]="Reverse"
    [8]="Hidden"
    [9]="Strikethrough"
  )

  local -A fg_colors
  for code in {30..37} {90..97}; do
    fg_colors[$code]="FG $code"
  done

  echo "\n--- Styles ---"
  for code style in ${(kv)styles}; do
    print -P "%K{black}%F{white}%B Style $code: $style %b%f%k -> %{\e[${code}m%}Sample Text%{\e[0m%}"
  done

  echo "\n--- Foreground Colors ---"
  for code in {30..37}; do
    print -P "FG $code -> %{\e[${code}m%}Sample Text%{\e[0m%}"
  done  
  for code in {90..97}; do
    print -P "FG $code -> %{\e[${code}m%}Sample Text%{\e[0m%}"
  done

  echo "\n--- Background Colors (40–47, 100–107) ---"
  for bg in {40..47} {100..107}; do
    print -P "BG $bg -> %{\e[${bg}m%}        %{\e[0m%}"
  done

  echo "\n--- 256 Foreground Colors ---"
  for i in {0..255}; do
    print -n -P "%F{$i}${i} %f"
    (( (i + 1) % 16 == 0 )) && print
  done

  echo "\n--- 256 Background Colors ---"
  for i in {0..255}; do
    print -n -P "%K{$i}  %k"
    (( (i + 1) % 16 == 0 )) && print
  done
}


function __text() {
    local style=$1
    shift
    case $style in
        link)
            echo -e "🔗\033[94m$@\033[0m"
            ;;
        *)
            echo "$@"
            ;;
    esac
}
