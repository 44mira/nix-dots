{
  programs.nixvim.plugins.conform-nvim = {
    enable = true;

    format_on_save = ''
      function(bufnr)
        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return { timeout_ms = 500, lsp_fallback = true }
      end,
    '';

    formattersByFt =
      {
        lua = [ "stylua" ];
        # Conform will run multiple formatters sequentially
        python = [ "black" ];
        go = [ "gopls" ];
        # Use a sub-list to run only the first available formatter
        javascript = [ [ "prettierd" "prettier" ] ];
        typescript = [ [ "prettierd" "prettier" ] ];
        typescriptreact = [ [ "prettierd" "prettier" ] ];
        json = [ [ "prettierd" "prettier" ] ];
        html = [ [ "prettierd" "prettier" ] ];
        bash = [[ "shfmt" ]];

        # Use the "*" filetype to run formatters on all filetypes.
        "*" = [ "codespell" ];
      };
  };
}
