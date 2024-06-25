{ pkgs, ... }:
{

  imports = [
    ./treesitter.nix
    ./mini.nix
    ./telescope.nix
    ./lualine.nix
    ./startify.nix
  ];

  programs.nixvim = {

    plugins = {

      gitsigns = {
        enable = true;
        settings.signs = {
          add.text = "+";
          change.text = "~";
        };
      };

      oil.enable = true;    # file management
      trim.enable = true;   # trim whitespace using :Trim
    };
    
    extraPlugins = with pkgs.vimPlugins; [
      nvim-web-devicons         # file icons
      telescope-ui-select-nvim  # telescope ui
      telescope-fzf-native-nvim # fzf algo for telescope
    ];
  };
}
