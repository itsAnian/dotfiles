{pkgs, ...}: {
  home.packages = with pkgs; [
    nix-search-tv
  ];

  programs.television = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      ui = {
        theme = "monokai";
      };
      shell_integration = {
        channel_triggers = {
          "git-branches" = ["git checkout"];
          "dirs" = ["ls"];
          "files" = ["cat" "nano"];
        };
      };
    };

    channels = {
      my-custom = {
        metadata = {
          name = "My custom channel";
        };
        cable_channel = [
          {
            name = "git-log";
            source = {
              type = "command";
              command = "git log --oneline --date=short --pretty=\"format:%h %s %an %cd\" \"$@\"";
            };
            preview_command = "git show -p --stat --pretty=fuller --color=always {0}";
          }
          {
            name = "nixpkgs";
            source = {
              type = "command";
              command = "nix-search-tv print";
            };
            preview_command = "nix-search-tv preview {}";
          }
          {
            name = "zsh_history";

            source = {
              type = "command";
              command = "sed '1!G;h;$!d' ~/.zsh_history";
              display = "{split:;:1..}";
              output = "{split:;:1..}";
            };
          }
        ];
      };
    };
  };
}
