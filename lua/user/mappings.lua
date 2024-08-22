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
    ["<c-x>"] = { "<cmd>ToggleTerm1<cr>", desc = "Term 1" },
    ["<c-y>"] = { "<cmd>ToggleTerm2<cr>", desc = "Term 2" },
    ["<c-a>"] = { "<cmd>ToggleTerm3 direction=horizontal size=15<cr>", desc = "Term 3" },
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
    ["<C-s>"] = { "<cmd>:w!<cr>", desc = "Save File" },  -- change description but the same command
    L = { function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end, desc = "Next buffer" },
    H = { function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end, desc = "Previous buffer" },

        -- GitConflictChooseOurs — Select the current changes. - cco
-- GitConflictChooseTheirs — Select the incoming changes.
-- GitConflictChooseBoth — Select both changes. - ccb
-- GitConflictChooseNone — Select none of the changes. - cc0
-- GitConflictNextConflict — Move to the next conflict. - ccn
-- GitConflictPrevConflict — Move to the previous conflict. - ccp
-- GitConflictListQf - Get all conflicts in quickfix list - ccq
        --
    ["cc"] = { name = "Git Conflict" },
    ["cco"] = { "<cmd>GitConflictChooseOurs<cr>", desc = "Choose Ours" },
    ["cct"] = { "<cmd>GitConflictChooseTheirs<cr>", desc = "Choose Theirs" },
    ["ccb"] = { "<cmd>GitConflictChooseBoth<cr>", desc = "Choose Both" },
    ["ccn"] = { "<cmd>GitConflictNextConflict<cr>", desc = "Next Conflict" },
    ["ccp"] = { "<cmd>GitConflictPrevConflict<cr>", desc = "Previous Conflict" },
    ["ccq"] = { "<cmd>GitConflictListQf<cr>", desc = "List Quickfix" },
    ["cc0"] = { "<cmd>GitConflictChooseNone<cr>", desc = "Choose None" },

        --Test single method
-- To test a single test, hover over the test and run lua require("neotest").run.run()
--
-- Test file
-- To test a file run lua require("neotest").run.run(vim.fn.expand("%"))
--
-- Test directory
-- To test a directory run lua require("neotest").run.run("path/to/directory")
--
-- Test suite
-- To test the full test suite run lua require("neotest").run.run({ suite = true })
        -- Test single test leader at
    ["<leader>a"] = { name = "PHP Actions" },
    ["<leader>at"] = { name = "Unit Tests" },
    ["<leader>ai"] = { name = "Middleware" },
    ["<leader>ac"] = { name = "Composer" },
        -- Test suite leader au
    ["<leader>atm"] = { "<cmd>lua require('neotest').run.run()<cr>", desc = "Method INLINE" },
    -- atf runs the current test file with lua require("neotest").run.run(vim.fn.expand("%"))
    ["<leader>atf"] = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", desc = "File INLINE" },
    -- att runs the current file but with TermExec cmd="composer test-functional -- %:p"
    ["<leader>att"] = { "<cmd>3TermExec cmd=\"composer test-unit -- %:p\" direction=horizontal size=10<cr>", desc = "File TERM" },
        -- ["<leader>au"] = { "<cmd>lua require('neotest').run.run(\"test\")<cr><cmd>Neotest summary open<cr>", desc = "Run all tests" },
    -- leader at executes unit test on current file
    -- ["<leader>at"] = { "<cmd>TermExec cmd=\"composer test-unit -- %:p\"<cr>", desc = "Run unit test" },
    -- leader ab executes all unit tests
    ["<leader>ata"] = { "<cmd>3TermExec cmd=\"composer test-unit-parallel-functional\" direction=horizontal size=30<cr>", desc = "All Parallel TERM" },
    -- leader af executes docker exec -ti mw-appmwdev-1 composer cs-fix
    ["<leader>af"] = { "<cmd>3TermExec cmd=\"composer cs-fix\" direction=horizontal size=5<cr>", desc = "Fix TERM" },
    -- leader ap executes pre-commit hook
    ["<leader>ap"] = { "<cmd>3TermExec cmd=\".git/hooks/pre-commit\" direction=horizontal size=30<cr>", desc = "Pre-Commit TERM" },

    -- leader ai shows name "Middleware"
    -- leader aip executes docker compose exec appmwdev composer phpstan
    ["<leader>aip"] = { "<cmd>TermExec cmd=\"docker compose exec appmwdev composer phpstan\"<cr>", desc = "PHPStan CONTAINER" },
    -- leader ac shows name "Composer"
    
    -- leader aci executes composer install
    ["<leader>aci"] = { "<cmd>TermExec cmd=\"composer install\"<cr>", desc = "Install" },
    -- leader aa executes composer phpstan
    ["<leader>acp"] = { "<cmd>TermExec cmd=\"composer phpstan\"<cr>", desc = "PHPStan TERM" },
    -- leader acu executes composer update
    ["<leader>acu"] = { "<cmd>TermExec cmd=\"composer update\"<cr>", desc = "Update" },
    -- leader acd executes composer dump-autoload
    ["<leader>acd"] = { "<cmd>TermExec cmd=\"composer dump-autoload\"<cr>", desc = "Dump Autoload" },
    -- leader acr writes composer require without executing
    ["<leader>acm"] = { "<cmd>TermExec cmd=\"composer migrations\"<cr>", desc = "Migrations" },
    -- Close the last tab "Empty" and show the dashboard with <leader>c
    -- leader fp performs :WorkspacesOpen
    ["<leader>fp"] = { "<cmd>WorkspacesOpen<cr>", desc = "Open Workspaces" },
    
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
    ["<c-g>"] = { "<cmd>ChatGPT<cr>", desc = "ChatGPT" },
  },
  i = {
    ["<c-x>"] = { "<cmd>ToggleTerm1<cr>", desc = "Term 1" },
    ["<c-y>"] = { "<cmd>ToggleTerm2<cr>", desc = "Term 2" },
    ["<c-a>"] = { "<cmd>ToggleTerm3<cr>", desc = "Term 3" },
    ["<C-s>"] = { "<cmd>:w!<cr>", desc = "Save File" },  -- change description but the same command
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
    ["<c-x>"] = { "<cmd>ToggleTerm<cr>", desc = "Term 1" },
    ["<c-y>"] = { "<cmd>ToggleTerm<cr>", desc = "Term 2" },
    ["<c-a>"] = { "<cmd>ToggleTerm<cr>", desc = "Term 3" },
  }, 
}
