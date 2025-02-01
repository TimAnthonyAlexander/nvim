return {
  "mfussenegger/nvim-dap",
  enabled = vim.fn.has "win32" == 0,
  dependencies = {
    {
      "jay-babu/mason-nvim-dap.nvim",
      dependencies = { "nvim-dap" },
      cmd = { "DapInstall", "DapUninstall" },
      opts = {
        ensure_installed = {'php'},
        handlers = {
            function(config)
                require('mason-nvim-dap').default_setup(config)
            end,
            php = function(config)
                config.configurations = {
                    {
                        type = 'php',
                        request = 'launch',
                        name = "Listen for XDebug",
                        port = 9008,
                        log = true,
                        pathMappings = {
                            ['/home/appmwdev/current/'] = vim.fn.getcwd() .. '/',
                        },
                        hostname = '0.0.0.0',
                    }
                }

                require('mason-nvim-dap').default_setup(config) -- don't forget this!
            end,
            } 
        },
    },
    {
      "rcarriga/nvim-dap-ui",
      opts = { floating = { border = "rounded" } },
      config = require "plugins.configs.nvim-dap-ui",
    },
    {
      "rcarriga/cmp-dap",
      dependencies = { "nvim-cmp" },
      config = require "plugins.configs.cmp-dap",
    },
  },
  event = "User AstroFile",
}
