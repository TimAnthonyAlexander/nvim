return {
  {
    "rlane/pounce.nvim",
    cmd = "Pounce",
    event = "BufRead",
    config = function()
      require("pounce").setup()
    end,
  },
  "nvim-telescope/telescope-fzf-native.nvim", 
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<C-f>",
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        copilot_node_command = 'node', -- Node.js version must be > 16.x
        server_opts_overrides = {},
      })
    end,
  },
  "f-person/git-blame.nvim",
  {
    "catppuccin/nvim",
      name = "catppuccin",
      config = function()
        require("catppuccin").setup {}
      end,
  },
  {
    "navarasu/onedark.nvim",
    name = "onedark",
    config = function()
      require("onedark").setup()
    end,
  },
  {
    "Mofiqul/vscode.nvim",
    config = function()
      require("vscode").setup()
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  },
  "nvim-lua/plenary.nvim",
  {
    "ThePrimeagen/harpoon",
    cmd = "Harpoon",
    config = function()
        require("harpoon").setup({

      })
    end,
  }
}
