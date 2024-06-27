{ pkgs, config, ... }: {

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    shellAliases = {
      hms = "home-manager switch --flake ~/nix-dots#tyrael";
      ns = "nix develop --command zsh";
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

      function yy() {
        local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
        yazi "$@" --cwd-file="$tmp"
        if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
          cd -- "$cwd"
        fi
        rm -f -- "$tmp"
      }
    '';
  };

  programs.zoxide.enable = true;

}
