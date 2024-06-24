{ pkgs, ... } : {

  # name of all modules
  imports = [
    ./home.nix   
    ./kitty.nix
    ./zsh.nix
    ./nvim.nix
    ./fastfetch.nix
  ];
}
