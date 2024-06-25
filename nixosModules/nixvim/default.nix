{ inputs, ... }: 

{
  imports = [
    ./options.nix
    ./keymappings.nix
    ./completion.nix
    ./plugins
  ];

  home.shellAliases.v = "nvim";

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    vimAlias = true;

    luaLoader.enable = true;
  };
}
