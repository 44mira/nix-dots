let
  custom_header = [
        ""
        "     ███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗"
        "     ████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║"
        "     ██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║"
        "     ██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║"
        "     ██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║"
        "     ╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝"
      ];
in
{
  programs.nixvim.plugins.startify = {
    enable = true;

    settings = {
      inherit custom_header;
      change_to_dir = false;
      fortune_use_unicode = true;

      files_number = 5;

      bookmarks = [
        "~/nix-dots"
        "~/nix-dots/nixosModules"
        "~/nix-dots/nixosModules/nixvim"
        "~/nix-dots/hypr"
      ];

      lists = [
        {
          type = "bookmarks";
          header = ["   Bookmarks"];
        }
        {
          type = "files";
          header = ["   Recent"];
        }
        {
          type = "dir";
          header = [{__raw = "'   Recent in' .. vim.loop.cwd()";}];
        }
      ];

      padding_left = 3;
    };
  };
}
