set encoding=utf-8
set noswapfile
set nu
set spelllang=en
set tabstop=4
set shiftwidth=4
set termguicolors
set guicursor+=a:blinkon2
set cmdheight=3

" split on bot
set splitbelow

set updatetime=100 "ms

call plug#begin("~/.vim/plugged")
	"========= COLORSCHEMES ========="
	Plug 'caglartoklu/borlandp.vim'
	Plug 'jaredgorski/spacecamp'
	Plug 'lifepillar/vim-solarized8'
	Plug 'vim-scripts/turbo.vim'
	" Plug 'flazz/vim-colorschemes'
	Plug 'rafi/awesome-vim-colorschemes'
	Plug 'xolox/vim-misc'
	Plug 'xolox/vim-colorscheme-switcher'
	Plug 'fcpg/vim-fahrenheit'
	"============ MISC ============="
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'ctrlpvim/ctrlp.vim' 

	Plug 'plasticboy/vim-markdown'
	Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
	Plug 'iamcco/mathjax-support-for-mkdp' 

	Plug 'itchyny/lightline.vim'
	Plug 'preservim/nerdtree'
	Plug 'Pocco81/TrueZen.nvim'
	Plug 'wakatime/vim-wakatime'

	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-surround'
	"===========  LANG  ============"
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
	Plug 'neoclide/jsonc.vim'
call plug#end()

" coc config
let g:coc_global_extensions = [
  \ 'coc-json', 
  \ 'coc-clangd', 
  \ 'coc-go', 
  \ 'coc-highlight', 
  \ 'coc-marketplace',
  \ 'coc-spell-checker',
  \ 'coc-yaml',
  \ 'coc-lists',
  \ 'coc-git',
  \ 'coc-cmake',
  \ ]

" ==================================== KEYS
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> <c-[> <Plug>(coc-definition)
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

nnoremap <silent> <A-q> :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

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
" colorscheme fahrenheit
colorscheme turbo

let g:go_def_mapping_enabled = 0
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_function_calls = 1
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 
autocmd BufEnter *.go nmap <leader>K  <Plug>(go-info)
" golang
let g:go_fmt_command = "goimports"
let g:go_textobj_include_function_doc = 1
let g:go_fmt_fail_silently = 1
let g:go_highlight_functions = 1
