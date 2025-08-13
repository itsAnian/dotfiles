# Installed packages

## configuration

### Services:
- xserver (enables X11 windowing system)
- upower (battery information)
- power-profiles-daemon (power profiles)
- greetd (login customization + start command hyprland)
- printing (enable CUPS to print docs)
- pipewire (improvement for audio and video)
- fprintd (fingerprint login)
    - to Add fingerprint add it with `sudo fprintd-enroll $USER`

### Programs:
- hyprland (desktop env)

### Packages:
- JetBrainsMono Font (font)

## home

### Aliases:
- nrs (nixos-rebuild flake)
- nsp (nix-shell -p)
- gs (git status)
- ga (git add)
- gc (git commit)
- gl (git log in one line)
- gd (git diff)
- ll (ls with more information)
- .. (one directory up)
- vi / vim (rebind to nvim)
- cd (rebind for z)
- weather (curls weather from wttr.in)
- cat (bat)

### Programs:
- brave bitwarden (password manager)
- zsh
- starship (terminal addon git branch etc.)
- git (git, nothing more to say)
- bash (enables bash)
- zoxide (smart cd)
- direnv (automatically activates flakes)

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
- edu-sync-cli (fetch and download moodle documents)
- unstable obsidian (IDE for Markdown / handwritten files)
- vlc (Media player)
- signal-desktop (Signal Messenger)
- nil (nix-language-server)
- alejandra (nix-formatting)
- nerd-fonts.jetbrains-mono (Nerdfont for icons)
- wl-clipboard (clipboard utils)
- ferdium (centralized chat client)
- bat (improved cat)
- tree (shows folder structure)

## tmp
To utilize the tmp file for temporary packages you have track it with git - this is a workaround so it is tracked but can not be commited.
```bash
git add --intent-to-add tmp.nix && \
git update-index --assume-unchanged tmp.nix
```

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

## kitty/kitty
### Programs:
- kitty (customizeable terminal)

### Hotkeys:
- shift + super + n (new tab)
- shift + super + p (close tab)
- shift + super + j (next tab)
- shift + super + k (previous tab)
