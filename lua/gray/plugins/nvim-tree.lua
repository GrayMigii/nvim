local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
  return
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup({
    modified = {
        enable = true,
        show_on_dirs = false,
    },

    tab = {
        sync = {
            open = true,
            close = true,
        },
    },
})
