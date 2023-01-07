# Nushell Environment Config File

def create_left_prompt [] {
    let path_segment = ($env.PWD)

    $path_segment
}

def create_right_prompt [] {
    let time_segment = ([
        (date now | date format '%m/%d/%Y %r')
    ] | str collect)

    $time_segment
}

# Use nushell functions to define your right and left prompt
let-env PROMPT_COMMAND = { create_left_prompt }
#let-env PROMPT_COMMAND_RIGHT = { create_right_prompt }

# The prompt indicators are environmental variables that represent
# the state of the prompt
#let-env PROMPT_INDICATOR = { "〉" }
#let-env PROMPT_INDICATOR_VI_INSERT = { ": " }
#let-env PROMPT_INDICATOR_VI_NORMAL = { "〉" }
#let-env PROMPT_MULTILINE_INDICATOR = { "::: " }

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
let-env ENV_CONVERSIONS = {
  "PATH": {
    from_string: { |s| $s | split row (char esep) }
    to_string: { |v| $v | str collect (char esep) }
  }
  "Path": {
    from_string: { |s| $s | split row (char esep) }
    to_string: { |v| $v | str collect (char esep) }
  }
}
let-env PATH = ($env.PATH | prepend '/home/arian/.cargo/bin')
# Directories to search for scripts when calling source or use
#
# By default, <nushell-config-dir>/scripts is added
let-env NU_LIB_DIRS = [
    ($nu.config-path | path dirname | path join 'scripts')
]

# Directories to search for plugin binaries when calling register
#
# By default, <nushell-config-dir>/plugins is added
let-env NU_PLUGIN_DIRS = [
    ($nu.config-path | path dirname | path join 'plugins')
]

# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
# let-env PATH = ($env.PATH | split row (char esep) | prepend '/some/path')
alias v = nvim
alias shd = shutdown now
alias msc = ncmpcpp
alias top = bpytop
alias dcker = sudo docker 
alias music = mpd && ncmpcpp
alias bt = upower -i /org/freedesktop/UPower/devices/battery_BAT0
alias t = tmux attach-session -t
alias unzipp = 7za x -P
alias rs = evcxr
alias md = mdbook serve
alias wasm = cargo generate --git https://github.com/rustwasm/wasm-pack-template
alias kl = xset led 3
alias angr = source ~/Hack/angr/bin/activate
alias ze = zellij
alias view = zathura

