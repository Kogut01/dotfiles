return {
  {
    "Mofiqul/dracula.nvim",
    lazy = false,       
    priority = 1000,      
    config = function()
      vim.cmd.colorscheme("dracula")

      -- Transparent Background
      vim.cmd([[
        hi Normal guibg=NONE ctermbg=NONE
        hi NormalNC guibg=NONE ctermbg=NONE
        hi SignColumn guibg=NONE ctermbg=NONE
        hi LineNr guibg=NONE ctermbg=NONE
        hi EndOfBuffer guibg=NONE ctermbg=NONE
      ]])
    end,
  },
}