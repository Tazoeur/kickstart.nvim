return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = {
    routes = {
      {
        filter = { event = 'notify', find = 'No information available' },
        opts = { skip = true },
      },
      preset = {
        lsp_doc_border = true,
      },
    },
  },
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
  keys = {
    -- clear the notification tray
    vim.keymap.set('n', '<leader>kk', '<cmd>NoiceDismiss<CR>', { desc = 'Dismiss Noice messag(s)' }),
  },
}
