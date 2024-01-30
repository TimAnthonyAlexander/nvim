-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<c-x>"] = { "<cmd>ToggleTerm1<cr>", desc = "Toggle Term" },
    ["<c-y>"] = { "<cmd>ToggleTerm2<cr>", desc = "Toggle Term" },
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr) require("astronvim.utils.buffer").close(bufnr) end)
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    L = { function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end, desc = "Next buffer" },
    H = { function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end, desc = "Previous buffer" },
    ["<leader>a"] = { name = "PHP Actions" },
    -- leader at executes unit test on current file
    ["<leader>at"] = { "<cmd>TermExec cmd=\"composer test-unit -- %:p\"<cr>", desc = "Run unit test" },
    -- leader ab executes all unit tests
    ["<leader>au"] = { "<cmd>TermExec cmd=\"composer test-unit\"<cr>", desc = "Run all unit tests" },
    -- leader af executes docker exec -ti mw-appmwdev-1 composer cs-fix
    ["<leader>af"] = { "<cmd>TermExec cmd=\"composer cs-fix\"<cr>", desc = "Run cs-fix" },
    -- leader ap executes pre-commit hook
    ["<leader>ap"] = { "<cmd>TermExec cmd=\".git/hooks/pre-commit\"<cr>", desc = "Run pre-commit" },
    -- leader ac shows name "Composer"
    ["<leader>ac"] = { name = "Composer" },
    -- leader aci executes composer install
    ["<leader>aci"] = { "<cmd>TermExec cmd=\"composer install\"<cr>", desc = "Run composer install" },
    -- leader acu executes composer update
    ["<leader>acu"] = { "<cmd>TermExec cmd=\"composer update\"<cr>", desc = "Run composer update" },
    -- leader acd executes composer dump-autoload
    ["<leader>acd"] = { "<cmd>TermExec cmd=\"composer dump-autoload\"<cr>", desc = "Run composer dump-autoload" },
    -- leader acr writes composer require without executing
    ["<leader>acm"] = { "<cmd>TermExec cmd=\"composer migrations\"<cr>", desc = "Run composer migrations" },
    -- Close the last tab "Empty" and show the dashboard with <leader>c
    ["<leader>bC"] = {
      function()
        local bufs = vim.fn.getbufinfo { buflisted = true }
        -- Close all buffers
        -- require("astronvim.utils.buffer").close(0)
        require("astronvim.utils.buffer").close_all()
        require("alpha").start(true)
      end,
      desc = "Close buffer",
    },
    ["<leader>c"] = {
      function()
        local bufs = vim.fn.getbufinfo { buflisted = true }
        require("astronvim.utils.buffer").close(0)
        if require("astronvim.utils").is_available "alpha-nvim" and not bufs[2] then require("alpha").start(true) end
      end,
      desc = "Close buffer",
    },
    -- Add C-h, C-j, C-k, C-l as window movement mappings
    ["<C-h>"] = { "<C-w>h", desc = "Move Left" },
    ["<C-j>"] = { "<C-w>j", desc = "Move Down" },
    ["<C-k>"] = { "<C-w>k", desc = "Move Up" },
    ["<C-l>"] = { "<C-w>l", desc = "Move Right" },
    -- Leader and j = pounce
    ["<leader>j"] = { "<cmd>Pounce<cr>", desc = "Pounce" },
  },
  i = {
    ["<c-x>"] = { "<cmd>ToggleTerm1<cr>", desc = "Toggle Term" },
    ["<c-y>"] = { "<cmd>ToggleTerm2<cr>", desc = "Toggle Term" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
    ["<c-x>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle Term" },
    ["<c-y>"] = { "<cmd>ToggleTerm<cr>", desc = "2Toggle Term" },
  }, 
}
