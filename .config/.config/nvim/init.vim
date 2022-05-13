syntax on

set encoding=utf-8
set tabstop=4
set mouse=a
set shiftwidth=4
set guicursor+=a:blinkon1
set background=dark
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
" Formatting selected code.
nmap <leader>f  <Plug>(coc-format-selected)
" sCpell
vmap <C-a> <Plug>(coc-codeaction-selected)
nmap <C-a> <Plug>(coc-codeaction-selected)

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


colorscheme darkblue
