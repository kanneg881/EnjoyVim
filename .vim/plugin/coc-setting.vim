" coc 設定

" 設定 node 路徑
let g:coc_node_path = "/usr/local/bin/node"

" 使用 tab 觸發帶有幾個字元的補全並導覽
" 使用指令 ':verbose imap <tab>' 確定 tab 沒有被映射到其他插件
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" 使用 <c-space> 觸發補全
inoremap <silent><expr> <c-space> coc#refresh()

" 使用 <cr> 確認補全，`<C-g>u` 表示在當前位置斷開撤消鏈
" Coc 僅在確認時做片段和額外編輯
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" 使用 `[g` 和 `]g` 瀏覽診斷
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" 重新映射Gotos的鍵
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" 使用 K 在預覽窗口中顯示文檔
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" 高亮 symbol 在游標 CursorHold 時
autocmd CursorHold * silent call CocActionAsync('highlight')

" 重新映射以重命名當前單詞
nmap <leader>rn <Plug>(coc-rename)

" 重新映射格式化選定區域
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " 設置 formatexpr 指定的 filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" 重新映射執行代碼選定區域的操作，例如：當前段落的<leader> aap
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" 重新映射代碼執行當前行的操作
nmap <leader>ac  <Plug>(coc-codeaction)
" 修復當前可修復的第一個錯誤修復操作
nmap <leader>qf  <Plug>(coc-fix-current)

" 建立映射給函式文本物件，需要 languageserver 的 document symbols feature
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" 使用 <TAB> 用於選擇範圍，必須 server 支援，像: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" 使用 `:Format` 格式化當前緩衝
command! -nargs=0 Format :call CocAction('format')

" 使用 `:Fold` 折疊當前緩衝
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" 使用 `:OR` 用於組織匯入當前緩衝區
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" 添加狀態行支持，以便與其他插件集成，查看 `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" 使用 CocList
" 顯示所有診斷
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" 管理擴充
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" 顯示指令
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" 尋找當前文件的 symbol
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" 尋找 workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" 對下一項執行默認操作。
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" 對上一項執行默認操作。
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" 恢復最新的 coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
