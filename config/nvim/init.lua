-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("lspconfig").ruff.setup({
  init_options = {
    settings = {
      -- Ruff language server settings go here
      lineLength = 100,
    },
  },
})
require("lazy").setup({{"shortcuts/no-neck-pain.nvim", version = "*"}})

---- Require the Neoscroll module
--local scroll = require("neoscroll").scroll
--
---- Define custom slower scrolling behavior
--local custom_scroll = {
--    -- Scroll 10 lines upwards (slower animation)
--    ["<C-u>"] = function()
--        scroll(-10, { move_cursor = true, duration = 600 })
--    end,
--    -- Scroll 10 lines downwards (slower animation)
--    ["<C-d>"] = function()
--        scroll(10, { move_cursor = true, duration = 600 })
--    end,
--    -- Scroll 'w:scroll' lines upwards (slower animation)
--    ["<C-b>"] = function()
--        scroll(-vim.wo.scroll, { move_cursor = true, duration = 800 })
--    end,
--    -- Scroll 'w:scroll' lines downwards (slower animation)
--    ["<C-f>"] = function()
--        scroll(vim.wo.scroll, { move_cursor = true, duration = 800 })
--    end,
--    -- Scroll 10% of the window height upwards (slower animation)
--    ["<C-y>"] = function()
--        scroll(-0.1, { move_cursor = false, duration = 400 })
--    end,
--    -- Scroll 10% of the window height downwards (slower animation)
--    ["<C-e>"] = function()
--        scroll(0.1, { move_cursor = false, duration = 400 })
--    end,
--}
--
---- Set the custom mappings
--for key, func in pairs(custom_scroll) do
--    vim.api.nvim_set_keymap("n", key, "", { noremap = true, silent = true, callback = func })
--end
