{ pkgs, ... }: {

  programs.waybar = {
    enable = true;

    settings = {
      layer = "top";
      position = "top";
      height = 24;
      spacing = 5;

      modules-left= ["hyprland/workspaces" "group/usage"];
      modules-center= "clock";
      modules-right= ["wireplumber" "group/bat" "group/net" "tray"];

      "group/usage" = {
          orientation= "horizontal";
          modules= ["memory" "temperature"];
      };

      "group/bat" = {
          orientation= "horizontal";
          modules= ["battery" "backlight"];
      };

      "group/net" = {
          orientation= "horizontal";
          modules= ["hyprland/language" "network" "bluetooth"];
      };

      "hyprland/workspaces" = {
          format = "{icon}";
          on-click = "activate";
          format-icons = {
              "1" = "\uf489";
              "2" = "\udb80\ude39";
              "3" = "\udb82\ude1e";
              "4" = "\uf001";
              "5" = "\ue217";
          };
          icon-size = 50;
          sort-by-number = true;
          persistent-workspaces = {
              "1" = [];
              "2" = [];
              "3" = [];
              "4" = [];
              "5" = [];
          };
      };

      clock = {
          format = "{=%d.%m.%Y | %H=%M}";
      };

      wireplumber = {
          format = "\udb81\udd7e  {volume}%";
          max-volume = 100;
          scroll-step = 5;
      };

      battery = {
          bat = "BAT1";
          interval = 60;
          format = "{icon}  {capacity}%";
          format-icons = ["\uf244" "\uf243" "\uf242" "\uf241" "\uf240"];
      };

      backlight = {
          format = "\udb80\udcdf  {percent}%";
      };

      memory = {
          interval = 30;
          format = "\uf4bc  {used=0.1f}G";
      };

      temperature = {
          format = " {temperatureC}°C";
      };

      network = {
          format = "";
          format-ethernet = "\udb83\udc9d ";
          format-wifi = "{icon} ";
          format-disconnected = "\udb83\udc9c ";
          format-icons = ["\udb82\udd2f" "\udb82\udd1f" "\udb82\udd22" "\udb82\udd25" "\udb82\udd28"];
          tooltip-format-wifi = "{essid} ({signalStrength}%)";
          tooltip-format-ethernet = "{ifname}";
          tooltip-format-disconnected = "Disconnected";
      };

      bluetooth = {
          format = "\udb80\udcaf";
          format-disabled = "\udb80\udcb2";
          format-connected = "\udb80\udcb1";
          tooltip-format = "{controller_alias}\t{controller_address}";
          tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
      };

      "hyprland/language" = {
          format = "{short}";
      };

      tray = {
          icon-size= 16;
          spacing= 16;
      };
    };
  };
}
