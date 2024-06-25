{
  config,
  lib,
  ...
}: {
  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    keymaps = let
      insert =
        lib.mapAttrsToList
        (key: action: {
          mode = "i";
          inherit action key;
        }) {

          # Sane normal mode
          "jk" = "<ESC>";

        };

      normal =
        lib.mapAttrsToList
        (key: action: {
          mode = "n";
          inherit action key;
        })
        {
          "<Space>" = "<NOP>";

          # Esc to clear search results
          "<esc>" = ":noh<CR>";

          # fix Y behaviour
          Y = "y$";

          # navigate to left/right window
          "<C-h>" = "<C-w>h";
          "<C-l>" = "<C-w>l";

          # resize with arrows
          "<C-Up>" = ":resize -2<CR>";
          "<C-Down>" = ":resize +2<CR>";
          "<C-Left>" = ":vertical resize +2<CR>";
          "<C-Right>" = ":vertical resize -2<CR>";

          # move current line up/down
          # M = Alt key
          "<M-k>" = ":move-2<CR>";
          "<M-j>" = ":move+<CR>";

          # Open Oil
          "<leader>f" = "<CMD>Oil<CR>";

          # Buffer navigation
          "<leader>bd" = "<CMD>:bd!<CR>";
          "<leader>b[" = "<CMD>:bp<CR>";
          "<leader>b]" = "<CMD>:bn<CR>";
        };

      visual =
        lib.mapAttrsToList
        (key: action: {
          mode = "v";
          inherit action key;
        })
        {
          # better indenting
          ">" = ">gv";
          "<" = "<gv";
          "<TAB>" = ">gv";
          "<S-TAB>" = "<gv";

          # move selected line / block of text in visual mode
          "K" = ":m '<-2<CR>gv=gv";
          "J" = ":m '>+1<CR>gv=gv";

          "<leader><leader>".__raw = "require('nvim-silicon').clip";
        };
    in
      config.nixvim.helpers.keymaps.mkKeymaps
      {options.silent = true;}
      (normal ++ visual ++ insert);
  };
}
