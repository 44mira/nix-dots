{

  imports = [
    ./treesitter.nix
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
      nvim-autopairs.enable = true;
    };

  };
}
