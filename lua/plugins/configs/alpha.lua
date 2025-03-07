return function(_, opts)
  require("alpha").setup(opts.config)

  vim.api.nvim_create_autocmd("User", {
    pattern = "LazyVimStarted",
    desc = "Add Alpha dashboard footer",
    once = true,
    callback = function()
      local stats = require("lazy").stats()
      local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
      opts.section.footer.val =
        { " ", " ", " ", "nvim loaded in " .. ms .. "ms" }
      opts.section.footer.opts.hl = "DashboardFooter"
      pcall(vim.cmd.AlphaRedraw)
    end,
  })
end
