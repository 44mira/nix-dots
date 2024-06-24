{ pkgs, config, inputs, ... }: {
  programs.neovim = 
    let
      toLua = str: "lua << EOF\n${str}\nEOF\n";
      toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
    in
    {
      enable = true;

      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      extraPackages = with pkgs; [
        luajitPackages.lua-lsp
        nil
        stylua
        prettierd

        xclip
        wl-clipboard
      ];

      plugins = with pkgs.vimPlugins; [

        {
          plugin = nvim-lspconfig;
          config = toLuaFile ./nvim/plugin/lsp.lua;
        }

        {
          plugin = neovim-ayu;
          config = toLua ''
            require('ayu').setup {
              mirage = true,
            }

            vim.cmd [[ colorscheme ayu ]]
          '';
        }

        nvim-cmp 
        {
          plugin = nvim-cmp;
          config = toLuaFile ./nvim/plugin/cmp.lua;
        }

        telescope-ui-select-nvim
        {
          plugin = telescope-nvim;
          config = toLuaFile ./nvim/plugin/telescope.lua;
        }

        telescope-fzf-native-nvim

        cmp_luasnip
        cmp-nvim-lsp

        luasnip
        friendly-snippets


        lualine-nvim
        nvim-web-devicons

        {
          plugin = (nvim-treesitter.withPlugins (p: [
            p.tree-sitter-nix
            p.tree-sitter-vim
            p.tree-sitter-bash
            p.tree-sitter-lua
            p.tree-sitter-python
            p.tree-sitter-json
            p.tree-sitter-c
            p.tree-sitter-cpp
            p.tree-sitter-bash
            p.tree-sitter-regex
            p.tree-sitter-html
            p.tree-sitter-dot
            p.tree-sitter-gitcommit
            p.tree-sitter-gitignore
            p.tree-sitter-haskell
            p.tree-sitter-heex
            p.tree-sitter-elixir
            p.tree-sitter-eex
            p.tree-sitter-rust
            p.tree-sitter-go
            p.tree-sitter-make
            p.tree-sitter-php
            p.tree-sitter-sql
            p.tree-sitter-tsx
          ]));
          config = toLuaFile ./nvim/plugin/treesitter.lua;
        }

        vim-nix

        {
          plugin = oil-nvim;
          config = toLuaFile ./nvim/plugin/oil.lua;
        }

        {
          plugin = lualine-nvim;
          config = toLuaFile ./nvim/plugin/lualine.lua;
        }

        {
          plugin = which-key-nvim;
          config = toLuaFile ./nvim/plugin/whichkey.lua;
        }

        {
          plugin = conform-nvim;
          config = toLuaFile ./nvim/plugin/conform.lua;
        }

        aerial-nvim

        # {
        #   plugin = vimPlugins.own-onedark-nvim;
        #   config = "colorscheme onedark";
        # }
      ];

      extraLuaConfig = ''
        ${builtins.readFile ./nvim/options.lua}
      '';

      # extraLuaConfig = ''
      #   ${builtins.readFile ./nvim/options.lua}
      #   ${builtins.readFile ./nvim/plugin/lsp.lua}
      #   ${builtins.readFile ./nvim/plugin/cmp.lua}
      #   ${builtins.readFile ./nvim/plugin/telescope.lua}
      #   ${builtins.readFile ./nvim/plugin/treesitter.lua}
      #   ${builtins.readFile ./nvim/plugin/other.lua}
      # '';
    };
}
