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
        require("catppuccin").setup( {
        flavour = "mocha",
      })
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
    "ray-x/aurora",
    config = function()
      require("aurora").colorscheme({
      })
    end,
  },
    "bluz71/vim-moonfly-colors",
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
    "wakatime/vim-wakatime",
     lazy=false,
     setup = function ()
         vim.cmd([[packadd wakatime/vim-wakatime]])
     end
  },
  {
    "luk400/vim-lichess",
    cmd = "Lichess",
    setup = function ()
      vim.cmd([[packadd luk400/vim-lichess]])
    end
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "TroubleToggle",
    opts = {
    },
  },
  {
    "HiPhish/nvim-ts-rainbow2",
    event = "BufEnter",
    config = function()
      require('nvim-treesitter.configs').setup {
        rainbow = {
          enable = true,
          query = {
            'rainbow-parens'
          },
          strategy = require('ts-rainbow').strategy.global,
          hlgroups = {
            'TSRainbowRed',
            'TSRainbowYellow',
            'TSRainbowBlue',
            'TSRainbowOrange',
            'TSRainbowGreen',
            'TSRainbowViolet',
            'TSRainbowCyan'
          },
        }
      }
    end,
  },
  {
    "ThePrimeagen/harpoon",
    cmd = "Harpoon",
    config = function()
        require("harpoon").setup({

      })
    end,
  }
}
