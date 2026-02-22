{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    history.share = false;
    plugins = [
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.8.0";
          sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
        };
      }
    ];
    completionInit = ''
      autoload -Uz compinit
      compinit -C

      # Compile the completion dump to increase startup speed
      if [[ ! -f ~/.zcompdump.zwc || ~/.zcompdump -nt ~/.zcompdump.zwc ]]; then
        zcompile ~/.zcompdump
      fi
    '';
  };
}
