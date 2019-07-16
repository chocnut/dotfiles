set encoding=UTF-8
filetype indent on
set number
set backspace=indent,eol,start

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-commentary'
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
Plug 'junegunn/vim-easy-align'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'mxw/vim-jsx',
Plug 'janko-m/vim-test',
Plug 'dracula/vim', { 'as': 'dracula' },
Plug 'vim-airline/vim-airline-themes'
" Initialize plugin system
call plug#end()

" Color Scheme
syntax enable
let mapleader=","
set ts=2 sw=2 et
set laststatus=2
set ruler
set backup
set backupdir=/private/tmp
set dir=/private/tmp
set lazyredraw
set clipboard+=unnamed
set ttyfast

colorscheme dracula

let g:indent_guide_start_level=2
let g:airline_powerline_fonts = 1
let g:airline_theme='dracula'
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
"noremap <C-P> :FZF<CR>
let g:fzf_layout = { 'down': '~20%' }
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'

"nerd tree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" remove unwanted white space
autocmd BufWritePre *.py :%s/\s\+$//e

" Prettier
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql PrettierAsync
let g:prettier#config#semi = 'false'
let g:prettier#config#bracket_spacing = 'true'

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Go stuff
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1


nnoremap <C-p> :FZF <cr>
nnoremap <leader>F :Files <cr>
nnoremap <leader>f :Gfiles <cr>
nnoremap <leader>b :Buffers <cr>
nnoremap <leader>a :Ag <cr>

" normal mode:
nnoremap <c-j> 5j
nnoremap <c-k> 5k
" visual mode:
xnoremap <c-j> 5j
xnoremap <c-k> 5k<Paste

