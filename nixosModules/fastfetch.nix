{ pkgs, ... } : {

  programs.fastfetch = {
    enable = true;

    settings = {
      logo = {
        "height" = 18;
      };
      display = {
          "separator"= " : ";
      };
      modules = [
        {
            "type"= "custom";
            "format"= "  💻  コンピューター";
        }
        {
            type = "custom";
            format = "┌──────────────────────────────────────────┐";
        }
        {
            type = "os";
            key = "    OS";
            keyColor = "red";
        }
        {
            type = "kernel";
            key = "    Kernel";
            keyColor = "red";
        }
        {
            type = "packages";
            key = "    Packages";
            keyColor = "green";
        }
        {
            type = "display";
            key = "  󰍹  Display";
            keyColor = "green";
        }
        {
            type = "wm";
            key = "    WM";
            keyColor = "yellow";
        }
        {
            type = "terminal";
            key = "    Terminal";
            keyColor = "yellow";
        }
        {
            type = "custom";
            format = "└──────────────────────────────────────────┘";
        }
        "break"
        {
            type = "title";
            key = "   ";
        }
        {
            type = "custom";
            format = "┌──────────────────────────────────────────┐";
        }
        {
            type = "cpu";
            format = "{1}";
            key = "  󰻠  CPU";
            keyColor = "blue";
        }
        {
            type = "gpu";
            format = "{2}";
            key = "    GPU";
            keyColor = "blue";
        }
        {
            type = "gpu";
            format = "{3}";
            key = "  󱁉  GPU Driver";
            keyColor = "magenta";
        }
        {
            type = "memory";
            key = "  󰍛  Memory";
            keyColor = "magenta";
        }
        {
            type = "custom";
            format = "└──────────────────────────────────────────┘";
        }
        "break"
        {
            type = "colors";
            paddingLeft = 2;
            symbol = "circle";
        }
        "break"
        ];
    };
  };
}
