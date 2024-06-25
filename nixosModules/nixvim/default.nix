{ pkgs, ... }:
{
  imports = [
    ./options.nix
    ./keymappings.nix
    ./completion.nix
    ./plugins
  ];

  home.shellAliases.v = "nvim";

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    vimAlias = true;

    luaLoader.enable = true;

    extraPackages = with pkgs; [
      silicon
      prettierd
      shfmt
      gopls
      black
      codespell
    ];

    extraConfigLua = ''
      -- Format on save disable on command
      vim.api.nvim_create_user_command('FormatDisable', function(args)
        if args.bang then
          -- FormatDisable! will disable formatting just for this buffer
          vim.b.disable_autoformat = true
        else
          vim.g.disable_autoformat = true
        end
      end, {
        desc = 'Disable autoformat-on-save',
        bang = true,
      })
      vim.api.nvim_create_user_command('FormatEnable', function()
        vim.b.disable_autoformat = false
        vim.g.disable_autoformat = false
      end, {
        desc = 'Re-enable autoformat-on-save',
      })
    '';
  };
}
