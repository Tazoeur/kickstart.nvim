return {
  'ThePrimeagen/harpoon',
  config = function()
    local mark = require 'harpoon.mark'
    local ui = require 'harpoon.ui'

    vim.keymap.set('n', '<leader>a', mark.add_file, { desc = 'Harpoon: mark file' })
    vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu, { desc = 'Harpoon: toggle meu' })
    vim.keymap.set('n', '<C-1>', function()
      ui.nav_file(1)
    end, { desc = 'Harpoon: go to file 1' })
    vim.keymap.set('n', '<C-2>', function()
      ui.nav_file(2)
    end, { desc = 'Harpoon: go to file 2' })
    vim.keymap.set('n', '<C-3>', function()
      ui.nav_file(3)
    end, { desc = 'Harpoon: go to file 3' })
    vim.keymap.set('n', 'hg1', function()
      ui.nav_file(1)
    end, { desc = 'Harpoon: go to file 1' })
    vim.keymap.set('n', 'hg2', function()
      ui.nav_file(2)
    end, { desc = 'Harpoon: go to file 2' })
    vim.keymap.set('n', 'hg3', function()
      ui.nav_file(3)
    end, { desc = 'Harpoon: go to file 3' })
    vim.keymap.set('n', 'hg4', function()
      ui.nav_file(4)
    end, { desc = 'Harpoon: go to file 4' })
    vim.keymap.set('n', 'hg5', function()
      ui.nav_file(5)
    end, { desc = 'Harpoon: go to file 5' })
  end,
}
