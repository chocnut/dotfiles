set encoding=UTF-8
filetype indent on
set number
set backspace=indent,eol,start

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-commentary'
Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'godlygeek/tabular'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-ruby/vim-ruby'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/gv.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/seoul256.vim'
Plug 'easymotion/vim-easymotion'
Plug 'rking/ag.vim'
Plug 'wikitopian/hardmode'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'mxw/vim-jsx',
Plug 'janko-m/vim-test'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'Yggdroot/indentline'
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'
" Plug 'nlknguyen/papercolor-theme'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline-themes'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" Plug 'ryanoasis/vim-devicons'
call plug#end()

" let g:seoul256_background = 233

" Color Scheme
syntax enable
" set background=dark
set ts=2 sw=2 et
set laststatus=2
set ruler
set cursorcolumn
set cursorline
set backup
set backup
set backupdir=/private/tmp
set dir=/private/tmp
set hlsearch
set ignorecase

set background=light
" colorscheme PaperColor
" colo seoul256
" colorscheme seoul256
colorscheme dracula


let g:indent_guide_start_level=2
let g:airline_powerline_fonts = 1
let g:airline_theme='dracula'
set signcolumn=yes
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'
noremap <C-P> :FZF<CR>
let g:fzf_layout = { 'down': '~20%' }
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'

" leader
:let mapleader=","

"nerd tree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" remove unwanted white space
autocmd BufWritePre *.py :%s/\s\+$//e

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
"
" " Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
set clipboard+=unnamed

set relativenumber
set norelativenumber  " turn relative line numbers off
set relativenumber!   " toggle relative line numbers

" HardMode Toggle
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>

" format with goimports instead of gofmt
let g:go_fmt_command = "goimports"
"
" Prettier
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql PrettierAsync
let g:prettier#config#semi = 'false'
let g:prettier#config#bracket_spacing = 'true'


" Asynchronous Lint Engine (ALE)
" Limit linters used for JavaScript.
let g:ale_linters = {
\  'javascript': ['flow', 'eslint'],
\}
"highlight clear ALEErrorSign " otherwise uses error bg color (typically red)
"highlight clear ALEWarningSign " otherwise uses error bg color (typically red)
let g:ale_sign_error = '💩' " could use emoji
let g:ale_sign_warning = '😅' " could use emoji
let g:ale_statusline_format = ['💩 %d', '😅 %d', '']
" %linter% is the name of the linter that provided the message
" %s is the error or warning message
let g:ale_echo_msg_format = '%linter% says %s'
" Map keys to navigate between lines with errors and warnings.
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>

" markdown
" requirements brew install grip
let vim_markdown_preview_github=1
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_browser='Google Chrome'
let vim_markdown_preview_toggle=3

let g:deoplete#enable_at_startup = 1

set spell
set complete+=kspell
set breakindent
set showbreak=\\\\\
set synmaxcol=200
set wildmenu
set wildmode=full
autocmd VimResized * wincmd =
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }


let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
set path=.,src,node_nodules
set suffixesadd=.js,.jsx

" Fzf ag under cursor
nnoremap <Leader>a :Ag <C-R><C-W><CR>:cw<CR>
