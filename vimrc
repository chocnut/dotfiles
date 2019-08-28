set encoding=UTF-8
filetype indent on
set number
set backspace=indent,eol,start

" coc extensions
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-json', 'coc-prettier']

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'vim-ruby/vim-ruby'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mxw/vim-jsx',
"Plug 'dracula/vim', { 'as': 'dracula' },
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'posva/vim-vue'
Plug 'ianks/vim-tsx'
Plug 'leafgarland/typescript-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'morhetz/gruvbox'

" Initialize plugin system

call plug#end()

"Coc
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" == AUTOCMD ================================ 
" by default .ts file are not identified as typescript and .tsx files are not
" identified as typescript react file, so add following
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.js setlocal filetype=typescript
au BufNewFile,BufRead *.jsx setlocal filetype=typescript.tsx
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
" == AUTOCMD END ================================


" Color Scheme
"syntax enable
set background=dark
syntax on

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
set textwidth=80

colorscheme gruvbox

let g:indent_guide_start_level=2
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
"noremap <C-P> :FZF<CR>
let g:fzf_layout = { 'down': '~20%' }
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'

" remove unwanted white space
autocmd BufWritePre *.py :%s/\s\+$//e

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
nnoremap <leader>g :Ag <cr>

" normal mode:
nnoremap <c-j> 5j
nnoremap <c-k> 5k
" visual mode:
xnoremap <c-j> 5j
xnoremap <c-k> 5k<Paste

if has('nvim')
  tnoremap <Esc> <C-\><C-n>

  " Maps ctrl-b + c to open a new tab window
  nnoremap <C-b>c :tabnew +terminal<CR>
  tnoremap <C-b>c <C-\><C-n>:tabnew +terminal<CR>

  " Maps ctrl-b + " to open a new horizontal split with a terminal
  nnoremap <C-b>" :new +terminal<CR>
  tnoremap <C-b>" <C-\><C-n>:new +terminal<CR>

  " Maps ctrl-b + % to open a new vertical split with a terminal
  nnoremap <C-b>% :vnew +terminal<CR>
  tnoremap <C-b>% <C-\><C-n>:vnew +terminal<cr>

  augroup neovim_terminal
    autocmd!

    " Enter Terminal-mode (insert) automatically
    autocmd TermOpen * startinsert

    " Disables number lines on terminal buffers
    autocmd TermOpen * :set nonumber norelativenumber
  augroup END
endif

"nerd tree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
