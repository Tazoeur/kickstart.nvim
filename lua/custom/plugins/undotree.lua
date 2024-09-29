-- Visualizes the undo history and makes it easy to browse and switch between different undo branches
-- https://github.com/mbbill/undotree

return {
  'mbbill/undotree',
  config = function()
    vim.keymap.set('n', '<leader>u', '<cmd>UndotreeToggle<CR>', { desc = '[U]ndo tree' })
  end,
}
