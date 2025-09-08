{pkgs, ...}: {
  programs.starship = {
    enable = true;

    settings = {
      add_newline = false;
      palette = "default";

      format = ''
        $nix_shell$status$directory$git_branch$git_status$cmd_duration$line_break(fg:separator)$character
      '';

      palettes.default = {
        prompt_ok = "#ffffff";
        prompt_err = "#e23140";
        icon = "#161514";
        separator = "#35312c";
        background = "#2d353b";

        directory = "#9f31e2";
        duration = "#e26f31";
        branch = "#ffea03";
        status = "#e23140";
        nix = "#42f2ff";
      };

      character = {
        success_symbol = "[❯](fg:prompt_ok)";
        error_symbol = "[❯](fg:prompt_err)";
      };

      directory = {
        format = "[](fg:directory)[ ](fg:icon bg:directory)[](fg:directory bg:background)[ $path](bg:background)[](fg:background) ";
        truncation_symbol = "../";
        truncate_to_repo = true;
        truncation_length = 2;
      };

      status = {
        format = "[](fg:status)[](fg:icon bg:status)[](fg:status bg:background)[ $status](bg:background)[](fg:background) ";
        pipestatus = true;
        pipestatus_separator = "-";
        pipestatus_segment_format = "$status";
        pipestatus_format = "[─](fg:separator)[](fg:status)[](fg:icon bg:status)[](fg:status bg:background)[ $pipestatus](bg:background)[](fg:background) ";
        disabled = false;
      };

      cmd_duration = {
        format = "[](fg:duration)[󱐋](fg:icon bg:duration)[](fg:duration bg:background)[ $duration](bg:background)[](fg:background) ";
        min_time = 1000;
      };

      time = {
        format = "[](fg:duration)[󰥔](fg:icon bg:duration)[](fg:duration bg:background)[ $time](bg:background)[](fg:background) ";
        disabled = false;
      };

      git_branch = {
        format = "[](fg:branch)[](fg:icon bg:branch)[](fg:branch bg:background)[ $branch](bg:background)";
        symbol = "";
        truncation_length = 30;
      };

      git_status = {
        format = ''[\[](fg:branch bg:background)[$all_status](fg:branch bg:background)[\]](fg:branch bg:background)[](fg:background) '';
        conflicted = "=";
        up_to_date = "";
        untracked = "?";
        stashed = "$";
        modified = "!";
        staged = "+";
        renamed = "»";
        deleted = "✘";
        ahead = "⇡";
        diverged = "⇕";
        behind = "⇣";
      };

      nix_shell = {
        format = "[](fg:nix)[❄](fg:icon bg:nix)[](fg:nix bg:background)[ nix-shell](bg:background)[](fg:background) ";
        disabled = false;
      };
    };
  };
}
