autocmd!
scriptencoding utf-8
syntax on

set nocompatible

set number
set title
set hidden
set splitbelow
set autoindent
set smartindent
set showcmd
set lazyredraw
" Ignore case when searching
set ignorecase
set termguicolors
" Be smart when using tabs ;)
set smarttab
set nobackup
set nowritebackup
set noswapfile
set nowrap "No Wrap lines


set encoding=utf-8
set tabstop=4
set mouse=a
set shiftwidth=4
set guicursor+=a:blinkon1
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Give more space for displaying messages.
set cmdheight=2
set updatetime=300
set background=dark
set laststatus=2
set clipboard=unnamedplus

" indents
filetype plugin indent on

call plug#begin()
	"========= COLORSCHEMES ========="
	Plug 'caglartoklu/borlandp.vim'
	Plug 'jaredgorski/spacecamp'
	Plug 'lifepillar/vim-solarized8'
	" Plug 'flazz/vim-colorschemes'
	Plug 'rafi/awesome-vim-colorschemes'
	Plug 'xolox/vim-misc'
	Plug 'xolox/vim-colorscheme-switcher'
	Plug 'fcpg/vim-fahrenheit'
	"===========  LANG  ============"
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
	Plug 'neoclide/jsonc.vim'
	"============ MISC ============="
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

	Plug 'plasticboy/vim-markdown'
	Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
	Plug 'iamcco/mathjax-support-for-mkdp' 

	Plug 'itchyny/lightline.vim'
	Plug 'preservim/nerdtree'
	Plug 'Pocco81/TrueZen.nvim'
	Plug 'wakatime/vim-wakatime'

	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-surround'
call plug#end()

" ==================================== KEYS
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

nmap <leader>f  <Plug>(coc-format-selected)
" xmap <c-q>  <Plug>(coc-codeaction-selected)
vmap <c-q> <Plug>(coc-codeaction-selected)
nmap <c-q> <Plug>(coc-codeaction-selected)

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Keybindings
"
nnoremap <silent><nowait><A-z> :TZAtaraxis<CR>
nnoremap <silent><nowait><C-E> :NERDTreeToggle<CR>

tnoremap <Esc> <C-\><C-n>

" ----------------------------- Commands
"
function WriteCreatingDirs()
    execute ':silent !mkdir -p %:h'
    write
endfunction
command W call WriteCreatingDirs()

let g:mkdp_browser = '/snap/bin/firefox'

" colorscheme darkblue
" colorscheme spacecamp

" Highlights "{{{
" ---------------------------------------------------------------------

set cursorline
" Set cursor line color on visual mode
" colorscheme solarizd8_flat
colorscheme fahrenheit
" colorscheme mountaineer

" highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40
" hi Normal guibg=000000 
" highlight NonText ctermbg=none
" highlight NonText guibg=none
"}}}

let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_function_calls = 1
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 
