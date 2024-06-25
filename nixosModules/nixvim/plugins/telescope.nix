{
  programs.nixvim.plugins.telescope = {
    enable = true;

    extensions = {
      ui-select = {
        enable = true;  # in case i add more
      };

      fzf-native.enable = true;
    };

    settings = {
      defaults = {
        layout_config = {
          horizontal = {
            prompt_position = "top";
          };
        };
        sorting_strategy = "ascending";
      };
    };

# [[ Keymaps ]] {{{
    keymaps = {
      "<leader>sf" = {
        action = "find_files";
        options = {
          desc = "[S]earch [f]iles";
        };
      };
      "<leader>sg" = {
        action = "live_grep";
        options = {
          desc = "[S]earch [g]rep";
        };
      };
      "<leader>s:" = {
        action = "command_history";
        options = {
          desc = "[S]earch [:]Command history";
        };
      };
      "<leader><leader>" = {
        action = "buffers";
        options = {
          desc = "[S]earch [b]uffers";
        };
      };
      "<leader>/" = {
        action = "current_buffer_fuzzy_find";
        options = {
          desc = "[S]earch [/]current buffer";
        };
      };

      "<leader>sc" = {
        action = "commands";
        options = {
          desc = "[S]earch [C]ommands";
        };
      };
      "<leader>sD" = {
        action = "diagnostics";
        options = {
          desc = "[S]earch Workspace [D]iagnostics";
        };
      };
      "<leader>sh" = {
        action = "help_tags";
        options = {
          desc = "[S]earch [H]elp pages";
        };
      };
      "<leader>sH" = {
        action = "highlights";
        options = {
          desc = "[S]earch [H]ighlight Groups";
        };
      };
      "<leader>sk" = {
        action = "keymaps";
        options = {
          desc = "[S]earch [k]eymaps";
        };
      };
      "<leader>sM" = {
        action = "man_pages";
        options = {
          desc = "Man pages";
        };
      };
      "<leader>sm" = {
        action = "marks";
        options = {
          desc = "Jump to Mark";
        };
      };
      "<leader>so" = {
        action = "vim_options";
        options = {
          desc = "Options";
        };
      };
    };
  };# }}}

}
