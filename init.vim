" ==============
" Install NEOVIM
" ==============
" https://github.com/neovim/neovim/wiki/Installing-Neovim
" Download and install NVIM v0.5.0 from https://github.com/neovim/neovim/releases
" Do not install NVIM v0.4.4 as it does not work with coc.nvim
"
" ===============================
" Install plugin manager vim-plug
" ===============================
" https://github.com/junegunn/vim-plug
"
" Linux Setup
" ===========
" sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
"       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"
" Windows Setup
" =============
" Run this command in PowerShell
" iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
"    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
"
" ==================
" Configure init.vim
" ==================
" This file is init.vim.
" To identify where to install this file, run this command in Neovim >> :echo stdpath('config')
"
" ===============
" Install plugins
" ===============
" Run nvim and run :PlugInstall
"
" Installation complete and you're good to go !
"
" Some useful commands:
"
" After editing init.vim, use this command to reload without having to exit neovim
" :source %
" :so %

set autoindent
set guicursor=
set nohlsearch
set number
set relativenumber
set hidden
set nowrap
set noswapfile
set nobackup
set incsearch
set scrolloff=8
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set mouse=a
set splitbelow
"set colorcolumn=80
set signcolumn=yes

" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
"Plug 'tpope/vim-sensible'
"Plug 'junegunn/seoul256.vim'

" If you are using Vim-Plug
"Plug 'shaunsingh/moonlight.nvim'
" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'ThePrimeagen/harpoon'

" NERDTree
" Run :NERDTreeToggle to activate
" Windows WSL Installation Steps:
" 1. Install this font in Windows
"	https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/CascadiaCode/Regular/complete/Caskaydia%20Cove%20Regular%20Nerd%20Font%20Complete%20Mono%20Windows%20Compatible.otf
" 2. Double click on the downloaded font file to open in Windows and identify the font name as "CaskaydiaCove NF"
" 3. Follow instructions in this page to change font for the specific profile.
"	https://pureinfotech.com/change-font-face-windows-terminal
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons' " icons for nerdtree

" Git
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'

" coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plug 'NTBBloodbath/rest.nvim'
"
Plug 'tpope/vim-surround' " Surrounding ysw)
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'ap/vim-css-color'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'tc50cal/vim-terminal'
Plug 'preservim/tagbar'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-scripts/dbext.vim'
"Plug 'octol/vim-cpp-enhanced-highlight'
"
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" https://www.freecodecamp.org/news/how-to-search-project-wide-vim-ripgrep-ack/
Plug 'mileszs/ack.vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Set <leader> to space bar
" In NORMAL mode, type space bar to activate leader
" e.g. <space> ff to activate Telescope
let mapleader = "\<Space>"

" ack.vim --- {{{
" Use ripgrep for searching ⚡️
" Options include:
" --vimgrep -> Needed to parse the rg response properly for ack.vim
" --type-not sql -> Avoid huge sql file dumps as it slows down the search
" --smart-case -> Search case insensitive if all lowercase pattern, Search case sensitively otherwise
let g:ackprg = 'rg --vimgrep --type-not sql --smart-case'
" Auto close the Quickfix list after pressing '<enter>' on a list item
let g:ack_autoclose = 1
" Any empty ack search will search for the work the cursor is on
let g:ack_use_cword_for_empty_search = 1
" Don't jump to first match
cnoreabbrev Ack Ack!
" Maps <leader>/ so we're ready to type the search keyword
nnoremap <Leader>/ :Ack!<Space>
" }}}

" Navigate quickfix list with ease
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>

" Telescope setup
lua << EOF
require('telescope').setup{ defaults = { file_ignore_patterns = {"node_modules"} } }
EOF

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" This is useful to ignore files in Telescope search result
" Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

" NERDTree setup
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

nnoremap <C-S-t> :belowright split term://bash<CR>
"map('n','<C-S-t>','<cmd>:belowright split term://bash<cr>')

" Set python provider for coc.nvim
let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python2'

" Make ctrl-w escape insert mode
tnoremap <C-w> <C-\><C-n><C-w>
inoremap <C-w> <esc><C-w>

" Plug 'NTBBloodbath/rest.nvim'
"nmap <C-h> <Plug>RestNvim

noremap <leader>0 :CocCommand rest-client.request <cr>

" Nyancat - https://github.com/koron/nyancat-vim
"command! -nargs=0 Nyancat call nyancat#start()
"command! -nargs=0 Nyancat2 call nyancat2#start()

" Set colorscheme to gruvbox
:colorscheme solarized8
":colorscheme gruvbox

"com! -nargs=1 -complete=dir Ncd NERDTree | cd <args> |NERDTreeCWD
com! -nargs=1 -complete=dir Ncd NERDTree <args>

nnoremap <leader>nn <cmd>NERDTree ~/<cr> " Change NERDTree root to home directory
if has('win32')
	let $homedir = $HOMEDRIVE."\\".$HOMEPATH
	nnoremap <leader><space>w <cmd>NERDTree c:\work\nvim<cr>
	nnoremap <leader><space>l <cmd>NERDTree c:\lab<cr>
	nnoremap <leader><space>a <cmd>NERDTree $homedir\.aws<cr>
	nnoremap <leader><space>k <cmd>NERDTree $homedir\.kube<cr>
	nnoremap <leader><space>o <cmd>NERDTree $homedir\.okta<cr>
	nnoremap <leader><space>n <cmd>NERDTree $homedir\AppData\Local\nvim<cr>
else
	nnoremap <leader>nl <cmd>NERDTree ~/lab<cr>
	nnoremap <leader>nk <cmd>NERDTree ~/lab<cr>
	nnoremap <leader>nw <cmd>NERDTree ~/mnt/c/work/nvim<cr>
endif

nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>

" Terminal
" Map <Esc> to get out of Terminal mode
" e.g. :belowright split term://bash
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif
" This maps keys to switch window pane while in Terminal edit mode
if has('nvim')
  tnoremap <c-h> <c-\><c-n><c-w>h
  tnoremap <c-j> <c-\><c-n><c-w>j
  tnoremap <c-k> <c-\><c-n><c-w>k
  tnoremap <c-l> <c-\><c-n><c-w>l
endif
" This maps keys to switch window pane while in Normal mode
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Zoom / Restore window.
function! s:ZoomToggle() abort
  if exists('t:zoomed') && t:zoomed
    execute t:zoom_winrestcmd
    let t:zoomed = 0
  else
    let t:zoom_winrestcmd = winrestcmd()
    resize
    vertical resize
    let t:zoomed = 1
  endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <C-A> :ZoomToggle<CR>

"augroup highlight_yank
"    autocmd!
"    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
"augroup END

augroup THE_PRIMEAGEN
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
    autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}
augroup END
