local opts = { noremap = true, silent = true }
return {
  'danymat/neogen',
  config = true,
  opts = {
    snippet_engine = 'luasnip',
    languages = {
      python = {
        template = {
          annotation_convention = 'numpydoc',
        },
      },
    },
  },
  vim.api.nvim_set_keymap('n', '<Leader>nf', ":lua require('neogen').generate()<CR>", { desc = '[N]eogen documentation for [F]unction' }),
  vim.api.nvim_set_keymap('n', '<Leader>nc', ":lua require('neogen').generate({ type = 'class' })<CR>", { desc = '[N]eogen documentation for [C]lass' }),
}
