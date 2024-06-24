{ pkgs, ... }: {
  programs.kitty = {
    enable = true;
    font = {
      name = "FantasqueSansM Nerd Font";
      size = 18;
    };
    # theme = "Catppuccin-Mocha";
    settings = {
      window_padding_width = 5;
      enabled_layouts = "horizontal, fat, stack";
      enable_audio_bell = false;
    };
  };
}
