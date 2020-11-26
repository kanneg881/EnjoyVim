" NERDTree 插件設定

" 當打開 Vim 時自動打開 NERDTree
" autocmd vimenter * NERDTree

" 關閉視窗時，視窗只剩下 NERDTree，則會關閉 Vim
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
