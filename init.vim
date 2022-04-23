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
	Plug 'OmniSharp/omnisharp-vim'
	Plug 'glepnir/lspsaga.nvim'
	Plug 'xolox/vim-colorscheme-switcher'
	Plug 'Pocco81/TrueZen.nvim'
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
	Plug 'wakatime/vim-wakatime'
	Plug 'cdelledonne/vim-cmake'
call plug#end()

" colorscheme
set background=dark
colorscheme alduin

" Coc setup
"
inoremap  <C-.> coc#refresh()
nmap <silent>gd :call CocAction('jumpDefinition', 'split')<CR>
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>qf <Plug>(coc-fix-current)
" Use Alt+Q to show documentation in preview window.
nnoremap <silent> <A-q> :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
nnoremap <silent><nowait><F4> :CocCommand clangd.switchSourceHeader<CR>

" Keybindings
"
nnoremap <silent><nowait><A-z> :TZAtaraxis<CR>
nnoremap <silent><nowait><A-0> :NERDTreeToggle<CR>
tnoremap <Esc> <C-\><C-n>

" golang
let g:go_fmt_command = "goimports"
let g:go_textobj_include_function_doc = 1
let g:go_fmt_fail_silently = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 :
