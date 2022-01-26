set encoding=utf-8
set noswapfile
set nu
set spelllang=en
set tabstop=4
set shiftwidth=4
" Give more space for displaying messages.
set cmdheight=2

set updatetime=1000 "ms

call plug#begin('~/.vim/plugged')
	Plug 'morhetz/gruvbox'
	Plug 'itchyny/lightline.vim'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-surround'
	Plug 'rafi/awesome-vim-colorschemes'
	Plug 'xolox/vim-misc'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'sheerun/vim-polyglot'
	Plug 'preservim/nerdtree'
	" Plug 'xolox/vim-colorscheme-switcher'
call plug#end()


set background=dark
" colorscheme gruvbox
colorscheme koehler
if (has('termguicolors'))
  set termguicolors
endif

" Coc setup
"
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-y> coc#refresh()

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Remap <C-f> and <C-b> for scroll float windows/popups.
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
