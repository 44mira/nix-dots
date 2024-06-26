{ pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;

    extraConfig = builtins.fromJSON ''
      configuration {
          modi: "drun";
          show-icons: true;
          display-drun: "";
      }

      listview {
          columns: 1;
          lines: 7;
          fixed-height: true;
          fixed-columns: true;
          cycle: false;
          scrollbar: false;
          border: 0px solid;
      }

      window {
          transparency: "real";
          width: 450px;
          border-radius: @b-radius;
          background-color: @wbg-color;
          border: @w-border;
          border-color: @w-border-color;
          padding: @w-padding;
      }

      prompt {
          text-color: @fg-color;
      }

      inputbar {
          children: ["prompt", "entry"];
          spacing: @g-spacing;
      }

      entry {
          placeholder: "Search Apps";
          text-color: @fg-color;
          placeholder-color: @fgp-color;
      }

      mainbox {
          spacing: @g-spacing;
          margin: @g-margin;
          padding: @g-padding;
          children: ["inputbar", "listview", "message"];
      }

      element {
          spacing: @g-spacing;
          margin: @g-margin;
          padding: @g-padding;
          border: 0px solid;
          border-radius: @b-radius;
          border-color: @b-color;
          background-color: transparent;
          text-color: @fg-color;
      }

      element normal.normal {
        background-color: transparent;
        text-color: @fg-color;
      }

      element alternate.normal {
        background-color: @alt-color;
        text-color: @fg-color;
      }

      element selected.active {
        background-color: @hl-color;
        text-color: @hlt-color;
      }

      element selected.normal {
        background-color: @hl-color;
        text-color: @hlt-color;
      }

      message {
          background-color: red;
          border: 0px solid;
      }
    '';
  };

}
