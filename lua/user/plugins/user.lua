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
        "Pocco81/auto-save.nvim",
    cmd = "ASToggle",
        config = function()
            require("auto-save").setup {
    enabled = true, -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
    execution_message = {
		message = function() -- message to print on save
			return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
		end,
		dim = 0.18, -- dim the color of `message`
		cleaning_interval = 1250, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
	},
    trigger_events = {"InsertLeave", "TextChanged"}, -- vim events that trigger auto-save. See :h events
	-- function that determines whether to save the current buffer or not
	-- return true: if buffer is ok to be saved
	-- return false: if it's not ok to be saved
	condition = function(buf)
		local fn = vim.fn
		local utils = require("auto-save.utils.data")

		if
			fn.getbufvar(buf, "&modifiable") == 1 and
			utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
			return true -- met condition(s), can save
		end
		return false -- can't save
	end,
    write_all_buffers = false, -- write all buffers when the current one meets `condition`
    debounce_delay = 135, -- saves the file at most every `debounce_delay` milliseconds
	callbacks = { -- functions to be executed at different intervals
		enabling = nil, -- ran when enabling auto-save
		disabling = nil, -- ran when disabling auto-save
		before_asserting_save = nil, -- ran before checking `condition`
		before_saving = nil, -- ran before doing the actual save
		after_saving = nil -- ran after doing the actual save
	}
}
        end,
  },
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
        "nvim-treesitter/nvim-treesitter-context",
        event = "BufRead",
        config = function()
            require("treesitter-context").setup {
                enable = true,
                max_lines = 3,
            }
        end,
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
      "jackMort/ChatGPT.nvim",
        commit = "d4aa4d9",
        event = "VeryLazy",
        config = function()
          require("chatgpt").setup {
           yank_register = "+", 
           edit_with_instructions = { 
             diff = false, 
             keymaps = { 
               close = "<C-c>", 
               accept = "<C-y>", 
               toggle_diff = "<C-d>", 
               toggle_settings = "<C-o>", 
               toggle_help = "<C-h>", 
               cycle_windows = "<Tab>", 
               use_output_as_input = "<C-i>", 
             }, 
           }, 
           chat = { 
             welcome_message = WELCOME_MESSAGE, 
             loading_text = "Loading, please wait ...", 
             question_sign = "", -- 🙂 
             answer_sign = "ﮧ", -- 🤖 
             border_left_sign = "", 
             border_right_sign = "", 
             max_line_length = 120, 
             sessions_window = { 
               active_sign = "  ", 
               inactive_sign = "  ", 
               current_line_sign = "", 
               border = { 
                 style = "rounded", 
                 text = { 
                   top = " Sessions ", 
                 }, 
               }, 
               win_options = { 
                 winhighlight = "Normal:Normal,FloatBorder:FloatBorder", 
               }, 
             }, 
             keymaps = { 
               close = "<C-g>", 
               yank_last = "<C-y>", 
               yank_last_code = "<C-k>", 
               scroll_up = "<C-u>", 
               scroll_down = "<C-d>", 
               new_session = "<C-n>", 
               cycle_windows = "<Tab>", 
               cycle_modes = "<C-f>", 
               next_message = "<C-j>", 
               prev_message = "<C-k>", 
               select_session = "<Space>", 
               rename_session = "r", 
               delete_session = "d", 
               draft_message = "<C-r>", 
               edit_message = "e", 
               delete_message = "d", 
               toggle_settings = "<C-o>", 
               toggle_sessions = "<C-p>", 
               toggle_help = "<C-h>", 
               toggle_message_role = "<C-r>", 
               toggle_system_role_open = "<C-s>", 
               stop_generating = "<C-x>", 
             }, 
           }, 
           popup_layout = { 
             default = "center", 
             center = { 
               width = "80%", 
               height = "80%", 
             }, 
             right = { 
               width = "30%", 
               width_settings_open = "50%", 
             }, 
           }, 
           popup_window = { 
             border = { 
               highlight = "FloatBorder", 
               style = "rounded", 
               text = { 
                 top = " ChatGPT ", 
               }, 
             }, 
             win_options = { 
               wrap = true, 
               linebreak = true, 
               foldcolumn = "1", 
               winhighlight = "Normal:Normal,FloatBorder:FloatBorder", 
             }, 
             buf_options = { 
               filetype = "markdown", 
             }, 
           }, 
           system_window = { 
             border = { 
               highlight = "FloatBorder", 
               style = "rounded", 
               text = { 
                 top = " SYSTEM ", 
               }, 
             }, 
             win_options = { 
               wrap = true, 
               linebreak = true, 
               foldcolumn = "2", 
               winhighlight = "Normal:Normal,FloatBorder:FloatBorder", 
             }, 
           }, 
           popup_input = { 
             prompt = "  ", 
             border = { 
               highlight = "FloatBorder", 
               style = "rounded", 
               text = { 
                 top_align = "center", 
                 top = " Prompt ", 
               }, 
             }, 
             win_options = { 
               winhighlight = "Normal:Normal,FloatBorder:FloatBorder", 
             }, 
             submit = "<C-Enter>", 
             submit_n = "<Enter>", 
             max_visible_lines = 20, 
           }, 
           settings_window = { 
             setting_sign = "  ", 
             border = { 
               style = "rounded", 
               text = { 
                 top = " Settings ", 
               }, 
             }, 
             win_options = { 
               winhighlight = "Normal:Normal,FloatBorder:FloatBorder", 
             }, 
           }, 
           help_window = { 
             setting_sign = "  ", 
             border = { 
               style = "rounded", 
               text = { 
                 top = " Help ", 
               }, 
             }, 
             win_options = { 
               winhighlight = "Normal:Normal,FloatBorder:FloatBorder", 
             }, 
           }, 
           openai_params = { 
             model = "gpt-4o",
             frequency_penalty = 0, 
             presence_penalty = 0, 
                    max_tokens = 300,item.chat.id === id 
                    ?3

             temperature = 0, 
             top_p = 1, 
             n = 1, 
           }, 
           openai_edit_params = { 
             frequency_penalty = 0, 
             presence_penalty = 0, 
             temperature = 0, 
             top_p = 1, 
             n = 1, 
           }, 
           use_openai_functions_for_edits = false, 
           actions_paths = {}, 
           show_quickfixes_cmd = "Trouble quickfix", 
           predefined_chat_gpt_prompts = "https://raw.githubusercontent.com/f/awesome-chatgpt-prompts/main/prompts.csv", 
           highlights = { 
             help_key = "@symbol", 
             help_description = "@comment", 
           }, 
         }
        end,
        dependencies = {
          "MunifTanjim/nui.nvim",
          "nvim-lua/plenary.nvim",
          "folke/trouble.nvim",
          "nvim-telescope/telescope.nvim"
        }
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
