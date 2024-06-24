{ config, pkgs, ... }:

{

  home.username = "tyrael";
  home.homeDirectory = "/home/tyrael";

  home.stateVersion = "23.11"; 

  home.packages = with pkgs; [
    eza
    oh-my-posh
    lazygit
    fastfetch
    vesktop
    gh
    (nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    sxiv
    mpv
    pavucontrol

    wayshot
    slurp
    wl-clipboard

    python3
    nodejs
    go

    gcc
    gnumake
    ripgrep
    fd
    fzf
    cargo
    unzip
    wget
    curl
  ];

  home.file = {
    ".omptheme.omp.toml".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/omptheme.omp.toml";
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  xdg.mimeApps.defaultApplications = {
    "image/*" = [ "sxiv.desktop" ]; 
    "video/png" = [ "mpv.desktop" ];
    "video/jpg" = [ "mpv.desktop" ];
    "video/*" = [ "mpv.desktop" ];
  };

  programs = {
    git = {
      enable = true;
      userName = "44mira";
      userEmail = "legolaslada@gmail.com";
    };

    yazi = {
      enable = true;
    };
  };

  gtk = {
    enable = true;
    theme.name = "spacx-gtk-theme";
    cursorTheme.name = "Bibata-Modern-Ice";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
