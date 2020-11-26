" 如果還沒安裝 vim-plug，則下載安裝它(限 Unix)
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs 
                \ https://raw.github.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" 高亮相對應的 css 顏色語法
Plug 'ap/vim-css-color'
" vim 和 tmux 移動視窗保持一致
Plug 'christoomey/vim-tmux-navigator'
" Dracula 吸血鬼主題
Plug 'dracula/vim', {'as': 'dracula'}
" 非同步自動檢查語法
Plug 'dense-analysis/ale'
" 語法片段補全
Plug 'honza/vim-snippets'
" 自動生成一對括號或其他成對的符號
Plug 'jiangmiao/auto-pairs'
" vim-plug 在 vim 的幫助文件
Plug 'junegunn/vim-plug'
" Vim 開始畫面變更好看
Plug 'mhinz/vim-startify'
" * 和 # 搜尋選取的內容
Plug 'nelstrom/vim-visual-star-search'
" 自動完成語法框架
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" 快速註解
Plug 'scrooloose/nerdcommenter'
" 可視化撤銷樹
Plug 'simnalamburt/vim-mundo'
" 在 vim 中操作 git
Plug 'tpope/vim-fugitive'
" 快速修改對稱的符號
Plug 'tpope/vim-surround'
" git 提交的瀏覽器
" 需要安裝 tpope/vim-fugitive
Plug 'junegunn/gv.vim'
" vim 底下的狀態欄美觀、主題
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Initialize plugin system
call plug#end()

autocmd BufReadPost *
            \ if line("'\"") > 1 && line("'\"") <= line("$") |
            \     exe "normal! g'\"" |
            \ endif

" 檔案類型為 text 設定文字寬度為 80
autocmd FileType text setlocal textwidth=80

" 檔案類型 檢測 插件 縮排 打開
filetype plugin indent on

packadd! matchit

" 存放 vim 相關的資料夾
silent !mkdir ~/.vim > /dev/null 2>&1
" 如果不存在交換檔案資料夾的話則自動建立交換檔案資料夾
silent !mkdir ~/.vim/swap > /dev/null 2>&1
" 如果不存在撤銷檔案資料夾的話則自動建立撤銷檔案資料夾
silent !mkdir ~/.vim/undo > /dev/null 2>&1
" 為所有插件載入幫助文件
silent! helptags ALL

" 換行時自動縮進
set autoindent
set backspace=indent,eol,start
" 使用 C/C++ 語言的自動縮排方式
set cindent
" 預設使用 * 暫存器，與系統剪貼簿共用位置
set clipboard=unnamed
" cmd 底下的行高
set cmdheight=3
" 交換文件統一存放目錄
set directory=$HOME/.vim/swap//
" tab 以空格取代
set expandtab
set foldcolumn=4
set foldmethod=indent
" gui 版 vim 字型
set guifont=MesloLGL\ Nerd\ Font:h18
" gui 版 vim 使用的部件和選項
set guioptions=egmrLT
" 保留修改了的緩衝區但不寫回
set hidden
" 記錄歷史Ex命令數
set history=100
set incsearch
" 在某些字元才能自動摺行，避免斷句不乾淨 
set linebreak
set iskeyword=@,48-57,_,192-255,-
" 顯示 tab 尾部空白、換行符號
set list
set listchars=tab:>-,trail:-
" 不備份文件
set nobackup
" 不顯示模式
set noshowmode
set nowrap
" 編輯時不備份文件
set nowritebackup
set nrformats-=octal
" 顯示行號
set number
" 顯示游標位置的行號和列號
set ruler
" 游標上下兩側最少保留的螢幕行數
set scrolloff=3
set sessionoptions+=unix,slash
" 不顯示插入補全選單訊息
set shortmess+=c
set showcmd
" 是否繪製標誌列
set signcolumn=yes
" 拼寫檢查功能，字典用
" set spell
" 如果打開，視窗的分割會把新視窗放到當前視窗之下
set splitbelow
" 如果打開，視窗的分割會把新視窗放到當前視窗之右
set splitright
" tab 空格數
" 符合 ts 空格是就變成 tab
" 縮排所需的 Space 個數
" 插入空白
set ts=4 sts=4 sw=4 et
" 儲存撤銷檔案在共用區
set undofile
" 撤銷檔案共用區路徑
set undodir=~/.vim/undo
" 如果過了這麼多毫秒數以後還沒有任何輸入，把交換文件寫入磁盤
set updatetime=300
set whichwrap=b,s,<,>,[,]
" 增強 Tab 自動補全，產生文件清單
set wildmenu
" list:longest 補全符合的最長字串
" full 打開 wildmenu
set wildmode=list:longest,full
" 超出視窗寬度的文字行都會被迴繞顯示
set wrap

source $VIMRUNTIME/ftplugin/man.vim

" 判斷是否安裝 vms
" if has("vms")
" 不備份文件
" set nobackup
" else
" 備份文件
" set backup
" endif

if &t_Co > 2 || has("gui_running")
    " 顏色數目
    set t_Co=256
    " 語法高亮
    syntax on
    " 高亮顯示搜尋匹配
    set hlsearch
endif
