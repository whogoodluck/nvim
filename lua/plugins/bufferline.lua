return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers", -- show opened files
        numbers = "none",
        diagnostics = "nvim_lsp",
        separator_style = "thick", -- "slant" | "padded_slant" | "thick" | "thin"
        -- show_buffer_close_icons = false,
        -- show_close_icon = false,
        always_show_bufferline = true,
        offsets = { {
          filetype = "neo-tree",
          text = "File Explorer",
          highlight = "Directory",
          separator = true
        } },
      },
    })

    -- Keymaps for switching buffers
    vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", { silent = true })
    vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", { silent = true })

    -- Close buffer
    vim.keymap.set("n", "<leader>x", "<Cmd>bdelete<CR>", { silent = true })

    -- Pick buffer
    vim.keymap.set("n", "<leader>bp", "<Cmd>BufferLinePick<CR>", { silent = true })
  end,
}
