{ pkgs, ... }:
{

  imports = [
    ./treesitter.nix
    ./mini.nix
    ./telescope.nix
    ./lualine.nix
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

      oil.enable = true;
    };
    
    extraPlugins = with pkgs.vimPlugins; [
      nvim-web-devicons         # file icons
      telescope-ui-select-nvim  # telescope ui
      telescope-fzf-native-nvim # fzf algo for telescope
    ];
  };
}
