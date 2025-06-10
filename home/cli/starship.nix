"$schema" = 'https://starship.rs/config-schema.json'

format = """
[](color_love)\
$os\
$username\
[](bg:color_gold fg:color_love)\
$directory\
[](fg:color_gold bg:color_pine)\
$git_branch\
$git_status\
[](fg:color_pine bg:color_foam)\
$c\
$cpp\
$rust\
$golang\
$nodejs\
$php\
$java\
$kotlin\
$haskell\
$python\
[](fg:color_foam bg:color_overlay)\
$docker_context\
$conda\
$pixi\
[](fg:color_overlay bg:color_surface)\
$time\
[ ](fg:color_surface)\
$line_break$character"""

palette = 'rose_pine'

[palettes.rose_pine]
color_base = '#191724'
color_surface = '#1f1d2e'
color_overlay = '#26233a'
color_muted = '#6e6a86'
color_subtle = '#908caa'
color_text = '#e0def4'
color_love = '#eb6f92'
color_gold = '#f6c177'
color_rose = '#ebbcba'
color_pine = '#31748f'
color_foam = '#9ccfd8'
color_iris = '#c4a7e7'

[os]
disabled = false
style = "bg:color_love fg:color_text"

[os.symbols]
Windows = "󰍲"
Ubuntu = "󰕈"
SUSE = ""
Raspbian = "󰐿"
Mint = "󰣭"
Macos = "󰀵"
Manjaro = ""
Linux = "󰌽"
Gentoo = "󰣨"
Fedora = "󰣛"
Alpine = ""
Amazon = ""
Android = ""
Arch = "󰣇"
Artix = "󰣇"
EndeavourOS = ""
CentOS = ""
Debian = "󰣚"
Redhat = "󱄛"
RedHatEnterprise = "󱄛"
Pop = ""

[username]
show_always = true
style_user = "bg:color_love fg:color_text"
style_root = "bg:color_love fg:color_text"
format = '[ $user ]($style)'

[directory]
style = "fg:color_base bg:color_gold"
format = "[ $path ]($style)"
truncation_length = 3
truncation_symbol = "…/"

[directory.substitutions]
"Documents" = "󰈙 "
"Downloads" = " "
"Music" = "󰝚 "
"Pictures" = " "
"Developer" = "󰲋 "

[git_branch]
symbol = ""
style = "bg:color_pine"
format = '[[ $symbol $branch ](fg:color_text bg:color_pine)]($style)'

[git_status]
style = "bg:color_pine"
format = '[[($all_status$ahead_behind )](fg:color_text bg:color_pine)]($style)'

[nodejs]
symbol = ""
style = "bg:color_foam"
format = '[[ $symbol( $version) ](fg:color_base bg:color_foam)]($style)'
disabled = false
detect_folders = ["node_modules"]
detect_files = ["package-lock.json", "pnpm-lock.yaml", "yarn.lock", "package.json"]
detect_extensions = ["js", "mjs", "cjs"]

# Disable nodejs in home directory specifically
[direnv]
disabled = true

[env_var.HOME]
format = ""

[c]
symbol = " "
style = "bg:color_foam"
format = '[[ $symbol( $version) ](fg:color_base bg:color_foam)]($style)'

[cpp]
symbol = " "
style = "bg:color_foam"
format = '[[ $symbol( $version) ](fg:color_base bg:color_foam)]($style)'

[rust]
symbol = ""
style = "bg:color_foam"
format = '[[ $symbol( $version) ](fg:color_base bg:color_foam)]($style)'

[golang]
symbol = ""
style = "bg:color_foam"
format = '[[ $symbol( $version) ](fg:color_base bg:color_foam)]($style)'

[php]
symbol = ""
style = "bg:color_foam"
format = '[[ $symbol( $version) ](fg:color_base bg:color_foam)]($style)'

[java]
symbol = ""
style = "bg:color_foam"
format = '[[ $symbol( $version) ](fg:color_base bg:color_foam)]($style)'

[kotlin]
symbol = ""
style = "bg:color_foam"
format = '[[ $symbol( $version) ](fg:color_base bg:color_foam)]($style)'

[haskell]
symbol = ""
style = "bg:color_foam"
format = '[[ $symbol( $version) ](fg:color_base bg:color_foam)]($style)'

[python]
symbol = ""
style = "bg:color_foam"
format = '[[ $symbol( $version) ](fg:color_base bg:color_foam)]($style)'

[docker_context]
symbol = ""
style = "bg:color_overlay"
format = '[[ $symbol( $context) ](fg:color_foam bg:color_overlay)]($style)'

[conda]
style = "bg:color_overlay"
format = '[[ $symbol( $environment) ](fg:color_foam bg:color_overlay)]($style)'

[pixi]
style = "bg:color_overlay"
format = '[[ $symbol( $version)( $environment) ](fg:color_text bg:color_overlay)]($style)'

[time]
disabled = false
time_format = "%R"
style = "bg:color_surface"
format = '[[  $time ](fg:color_text bg:color_surface)]($style)'

[line_break]
disabled = false

[character]
disabled = false
success_symbol = '[➜](bold fg:color_pine)'
error_symbol = '[➜](bold fg:color_love)'
vimcmd_symbol = '[❯](bold fg:color_pine)'
vimcmd_replace_one_symbol = '[❯](bold fg:color_iris)'
vimcmd_replace_symbol = '[❯](bold fg:color_iris)'
vimcmd_visual_symbol = '[❯](bold fg:color_gold)'
