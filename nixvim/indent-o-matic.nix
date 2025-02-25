{ config, pkgs, inputs, ... }:

{
  programs.nixvim = {
    plugins = {
      indent-o-matic = {
        enable = true;
        settings = {
          max_lines = 2048;
          skip_multiline = false;
          standard_widths = [
            2
              4
              6
              8
              10
              12
              14
              16
              18
              20
              22
              24
              26
              28
              30
          ];
        };
      };
    };
  };
}
