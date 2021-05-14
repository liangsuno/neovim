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

:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a

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

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Set <leader> to space bar
" In NORMAL mode, type space bar to activate leader
" e.g. <space> ff to activate Telescope
let mapleader = "\<Space>"

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
set wildignore+=.*,*/node_modules/*,_site,*/__pycache__/,*/venv/*,*/target/*,*/.vim$,\~$,*/.log,*/.aux,*/.cls,*/.aux,*/.bbl,*/.blg,*/.fls,*/.fdb*/,*/.toc,*/.out,*/.glo,*/.log,*/.ist,*/.fdb_latexmk

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
:colorscheme gruvbox