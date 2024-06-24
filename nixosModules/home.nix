{ config, pkgs, ... }:

{


  stylix = {
    enable = true;
    autoEnable = true;
    image = ../nixchan.png;
    polarity = "dark";

    fonts = {
      monospace = {
        package = pkgs.nerdfonts;
        name = "FantasqueSansM Nerd Font";
      };

      sansSerif = {
        package = pkgs.nerdfonts;
        name = "CommitMono Nerd Font";
      };

      sizes = {
        terminal = 17;
        popups = 13;
        desktop = 14;
        applications = 14;
      };
    };
  };

  home.username = "tyrael";
  home.homeDirectory = "/home/tyrael";

  home.stateVersion = "23.11"; 

# [[ Installed packages ]] {{{
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
    waybar
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
# }}}

  home.file = {
    ".omptheme.omp.toml".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/omptheme.omp.toml";
    "Pictures/nixchan.png".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/nixchan.png";
    ".config/waybar/config".source = ./waybar/config;
    ".config/hyprland".recursive = ./hyprland;
  };


  home.sessionVariables = {
    EDITOR = "nvim";
    MANPAGER="sh -c 'col -bx | bat -l man -p'";
    MANROFFOPT="-c";
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

    waybar = {
      enable = true;
    };

    rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
    };

    bat = {
      enable = true;
      config = {
        theme = "base16-stylix";
      };
    };

  };

  services.hyprpaper.settings = {
    enable = true;
    ipc = "on";
    splash = false;
    splash_offset = 2.0;

    preload = [
      "~/Pictures/nixchan.png"
    ];

    wallpaper = [
      "DP-1,~/Pictures/nixchan.png"
    ];
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
