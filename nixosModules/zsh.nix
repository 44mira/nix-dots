{ pkgs, config, ... }: {

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    shellAliases = {
      hms = "home-manager switch --flake ~/nix-dots#tyrael";
      nv = "nvim";
      lg = "lazygit";
      ff = "fastfetch --disable-linewrap";
      ls = "exa";
      ll = "exa -l";
      mhc = "man home-configuration.nix";
      mnc = "man configuration.nix";
    };
    initExtra = ''
      eval "$(oh-my-posh init zsh --config ~/.omptheme.omp.toml)"
    '';
  };

  programs.zoxide.enable = true;

}
