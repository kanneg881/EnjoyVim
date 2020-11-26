" 使用 <C-l> 觸發程式碼片段擴展
imap <C-l> <Plug>(coc-snippets-expand)
" 使用 <C-j> 用於程式碼片段的可視佔位符的選擇文本
vmap <C-j> <Plug>(coc-snippets-select)

" 使用 <C-j> 跳轉到下一個佔位符，coc.nvim 預設值
let g:coc_snippet_next = '<c-j>'
" 使用 <C-k> 要跳轉到上一個佔位符，coc.nvim 預設值
let g:coc_snippet_prev = '<c-k>'
