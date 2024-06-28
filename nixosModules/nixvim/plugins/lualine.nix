{
  programs.nixvim.plugins.lualine = {
    enable = true;

    sections = {

      lualine_b = [
        "branch"
      ];

      lualine_c = [
        "filename"
      ];

      lualine_x = [
        "diff"
        "diagnostics"
      ];

      lualine_y = [
        "filetype"
      ];

      lualine_z = [
        "(function() return [[  sharms]] end)()"
      ];

    };

    sectionSeparators = {
      left = "◤";
      right = "◢";
    };
  };
}
