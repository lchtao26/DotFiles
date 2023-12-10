local autocmd = vim.api.nvim_create_autocmd

autocmd('BufWritePost', {
  pattern = '*_lesson/**/*.less',
  command = 'Dispatch! lessc % %:p:h/%:t:r.css',
  group = 'Buf',
})
