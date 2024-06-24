require('telescope').setup {
        -- defaults = {
        --   mappings = {
        --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
        --   },
        -- },
        pickers = {
          find_files = {
            hidden = true,
            no_ignore = true,
            follow = true,
          },
        },
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
          aerial = {
            -- Display symbols as <root>.<parent>.<symbol>
            show_nesting = {
              ['_'] = false, -- This key will be the default
              json = true, -- You can set the option for specific filetypes
              yaml = true,
            },
          },
        },
      }

-- Enable telescope extensions, if they are installed
pcall(require('telescope').load_extension 'fzf')
pcall(require('telescope').load_extension 'ui-select')
pcall(require('telescope').load_extension 'aerial')

-- See `:help telescope.builtin`

