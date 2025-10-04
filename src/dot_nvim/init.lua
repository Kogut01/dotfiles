-- Minimal Config
vim.o.termguicolors = true         
vim.o.number = true             

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Plugin Config
require("lazy").setup({
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
})
