{ pkgs, inputs, ... }:

let
  toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
in
{

  imports = [
    ./treesitter.nix
    ./mini.nix
    ./telescope.nix
    ./lualine.nix
    ./startify.nix
    ./neoscroll.nix
    ./conform-nvim.nix
  ];

  nixpkgs = {
    overlays = [
      (final: prev: {
        vimPlugins = prev.vimPlugins // {
          silicon = prev.vimUtils.buildVimPlugin {
            name = "silicon";
            src = inputs.plugin-silicon;
          };
        };
      })
    ];
  };

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

      {
        plugin = pkgs.vimPlugins.silicon;
        config = toLuaFile ./silicon.lua;
      }
    ];
  };
}
