-- Automatically save your changes in NeoVim
-- https://github.com/pocco81/auto-save.nvim

return {
  'pocco81/auto-save.nvim',
  enabled = false,
  trigger_events = { 'FocusLost', 'UILeave', 'TabLeave' },
  -- vim.api.nvim_set_keymap('n', '<leader>ts', ':ASToggle<CR>', { desc = '[T]oggle auto-[S]ave' }),
}
