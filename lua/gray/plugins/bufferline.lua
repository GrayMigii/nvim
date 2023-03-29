local status, bufferline = pcall(require, "bufferline")
if not status then
  return
end

bufferline.setup {
    options = {
        mode = "buffers",
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                text_align = "center",
                separator = true,
            }
        },
    },
}
