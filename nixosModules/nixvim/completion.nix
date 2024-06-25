{
  programs.nixvim = {
    opts.completeopt = ["menu" "menuone" "noselect"];

    plugins = {
      luasnip.enable = true;

# [[ LSP ]] {{{
      lsp = {
        enable = true;

        servers = {
          nil-ls.enable = true;
          gopls.enable = true;
          pyright.enable = true;
          clangd.enable = true;
          lua-ls.enable = true;
          tsserver.enable = true;
          bashls.enable = true;
          html.enable = true;
          cssls.enable = true;
          tailwindcss.enable = true;
          hls.enable = true;
          elixirls.enable = true;

          rust-analyzer = {
            enable = true;

            installCargo = false;
            installRustc = false;
          };
        };
# }}}

      };

      lspkind = {
        enable = true;

        cmp = {
          enable = true;
          menu = {
            nvim_lsp = "[LSP]";
            nvim_lua = "[api]";
            path = "[path]";
            luasnip = "[snip]";
            buffer = "[buffer]";
            cmp_tabby = "[Tabby]";
          };
        };
      };

      cmp = {
        enable = true;

        settings = {
          snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";

          mapping = {
            "<C-d>" = "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-e>" = "cmp.mapping.close()";
            "<C-n>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
            "<C-p>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
          };

          sources = [
            {name = "path";}
            {name = "nvim_lsp";}
            {name = "cmp_tabby";}
            {name = "luasnip";}
            {
              name = "buffer";
              # Words from other open buffers can also be suggested.
              option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
            }
          ];
        };
      };

    };
  };
}
