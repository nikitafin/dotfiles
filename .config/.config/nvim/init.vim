syntax on

set encoding=utf-8
set tabstop=4
set mouse=a
set shiftwidth=4
set guicursor+=a:blinkon1
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Some servers have issues with backup files, see #649.
set nobackup

set nowritebackup
set noswapfile
set hidden
set splitbelow
set smartindent

call plug#begin()
	"========= COLORSCHEMES ========="
	Plug 'caglartoklu/borlandp.vim'
	Plug 'jaredgorski/spacecamp'
	Plug 'lifepillar/vim-solarized8'
	"===========  LANG  ============"
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
	Plug 'neoclide/jsonc.vim'
	"============ MISC ============="
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

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

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

nmap <leader>f  <Plug>(coc-format-selected)
vmap <c-q> <Plug>(coc-codeaction)
nmap <c-q> <Plug>(coc-codeaction)
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


" colorscheme darkblue
" colorscheme spacecamp
set background=dark
set termguicolors
colorscheme solarized8_flat
