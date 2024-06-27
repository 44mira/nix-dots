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

    cursor.name = "Bibata-Modern-Ice";
    cursor.package = pkgs.bibata-cursors;

    targets = {
      waybar.enableCenterBackColors = true;
    };
  };

  home.username = "tyrael";
  home.homeDirectory = "/home/tyrael";

  home.stateVersion = "23.11";

# [[ Installed packages ]] {{{
  home.packages = with pkgs; [
    zoom-us
    krita
    vesktop

    eza
    oh-my-posh
    lazygit
    fastfetch
    gh
    (nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    sxiv
    mpv
    xdg-utils
    pavucontrol
    rofi-power-menu
    dolphin
    bottles
    lutris
    protonup

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
    rustup
    unzip
    wget
    curl
  ];
# }}}

  home.file = {
    ".omptheme.omp.toml".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/omptheme.omp.toml";
    "Pictures/nixchan.png".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/nixchan.png";
    ".config/hypr/start.sh".source = config.lib.file.mkOutOfStoreSymlink ./hypr/start.sh;
  };

  xdg.configFile."waybar/config".source = config.lib.file.mkOutOfStoreSymlink ./waybar/config;
  xdg.configFile."hypr/hyprland.conf".source = config.lib.file.mkOutOfStoreSymlink ./hypr/hyprland.conf;

  home.sessionVariables = {
    EDITOR = "nvim";
    MANPAGER="sh -c 'col -bx | bat -l man -p'";
    MANROFFOPT="-c";
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "${config.home.homeDirectory}/.steam/root/compatibilitytools.d";
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

    waybar = {
      enable = true;
    };

    bat = {
      enable = true;
      config = {
        theme = "base16-stylix";
      };
    };

  };

  services = {
    dunst = {
      enable = true;
      settings = {
        global = {
          offset = "20x20";
          corner_radius = 10;
          icon_theme = "Adwaita";
        };
      };
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
