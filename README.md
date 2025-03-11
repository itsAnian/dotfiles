# Installed packages

## configuration

### Services:
- xserver (enables X11 windowing system)
- upower (battery information)
- power-profiles-daemon (power profiles)
- greetd (login customization + start command hyprland)
- printing (enable CUPS to print docs)
- pipewire (improvement for audio and video)

### Programs:
- hyprland (desktop env)

### Packages:
- JetBrainsMono Font (font)

## home

### Aliases:
- nrs (nixos-rebuild flake)
- gs (git status)
- ga (git add)
- gc (git commit)
- gl (git log in one line)
- gd (git diff)
- ll (ls with more information)
- .. (one directory up)

### Programs:
- brave 
    - bitwarden (password manager)
- zsh
- starship (terminal addon git branch etc.)
- git (git, nothing more to say)
- bash (enables bash)

### Packages:
- vesktop (discord client with vencord)
- zapzap (whatsappweb client)
- p3x-onenote (onenote client for nixos)
- spotify (spotify)
- vscode (visual studio code)
- bitwarden (password manager)
- gimp (image editing software)
- superfile (terminal filemanager)
- lua-language-server (neovim needs it for lsp)
- unstable presenterm (presentation in terminal with markdown)
- nwg-displays (gui for monitor settings)
- remnote (note taking application)
- todo-shell (selfwritten todo-list in shell)

## rofi
### Programs:
- rofi (application launcher)

## hyprland/hyprland
### Packages:
- dunst (notification manager)
- libnotify (dunst relies on it)
- networkmanagerapplet (networkmanager)
- hyprshot (enables screenshots)
- brightnessctl (enables brightness control)
### Hotkeys:
- Super + q (opens terminal)
- Super + c (kills window)
- Super + m (exit)
- Super + e (opens filemanager)
- Super + v (toggels floating)
- Super + r (opens rofi launcher)
- Super + p (pseudo? default hotkey)
- Super + j (toggle split)
- Super + left (move focus left)
- Super + right (move focus right)
- Super + up (move focus up)
- Super + down (move focus down)
- Super + L (locks the session)
- Super + S (screenshot for region into clipboard)
- Super + mouse:272 (movewindow)
- Super + ALT + mouse:272 (resizewindow)

## hyprland/hypridle
### Packages:
- hypridle (change behaviour while idle)

## hyprland/hyprlock
### Programs:
- hyprlock (locks the session)

## hyprland/wpaperd
### Packages:
- wpaperd (lets you set wallpaper)

## hyprland/hyprpanel
### Packages (hyprpanel relies on these):
- wireplumber (session & policy manager for pipewire)
- libgtop (information about system)
- bluez (bluetooth control)
- networkmanager (networkmanager)
- dart-sass (css preprocessor language)
- wl-clipboard (commandlinetools for clipboard)
- upower (battery management)
- gvfs (virtual filesystem)

## kitty/kitty
### Programs:
- kitty (customizeable terminal)

### Hotkeys:
- ctrl + alt + n (new tab)
- ctrl + alt + # (close tab)
- ctrl + alt + j (next tab)
- ctrl + alt + k (previous tab)
