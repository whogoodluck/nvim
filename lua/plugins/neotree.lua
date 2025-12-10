return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons", -- optional, but recommended
  },
  lazy = false, -- neo-tree will lazily load itself
  config = function()
    require('neo-tree').setup({
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_hidden = false,
          hide_gitignored = false,

          hide_by_name = {
            ".git",
          }
        }
      }
    })

    vim.keymap.set('n', '<C-n>', ':Neotree source=filesystem reveal=true position=left<CR>', {})
    vim.keymap.set('n', '<C-m>', ':Neotree close<CR>', {})
  end
}
