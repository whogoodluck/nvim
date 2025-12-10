return {
  "navarasu/onedark.nvim",
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require('onedark').setup {
      style = 'warmer' -- dark, darker, cool, deep, warm, warmer
    }
    require('onedark').load()
  end
}

-- return {
--     "folke/tokyonight.nvim",
--     lazy = false, 
--     priority = 1000, 
--     config = function()
--       vim.cmd([[colorscheme tokyonight]])
--     end,
-- }

-- return {
-- 	"rjshkhr/shadow.nvim",
-- 	-- dir = "~/Projects/personal/shadow.nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		vim.opt.termguicolors = true
-- 		vim.cmd.colorscheme("shadow")
-- 	end,
-- }
