set encoding=utf-8
set noswapfile
set spelllang=en
set tabstop=4
set shiftwidth=4
set termguicolors
set guicursor+=a:blinkon2
set cmdheight=3

set splitbelow " split on bot

set nobackup
set nowritebackup

set title
set hidden


set updatetime=300 "ms

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
	Plug 'cdelledonne/vim-cmake'
	Plug 'plasticboy/vim-markdown'
call plug#end()

"------ colorscheme ------
filetype plugin indent on
syntax on
	" colorscheme alduin
colorscheme blue

" ------ Coc setup ------

" Use <c-space> to trigger completion.
inoremap  <C-.> coc#refresh()

" GoTo code navigation.
	" nmap <silent> gd :sp<CR><Plug>(coc-definition)
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

"------------------------------------------ NERDTree
let NERDTreeShowHidden=1
"------------------------------------------ Markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_fenced_languages = ['tsx=typescriptreact']

" Keybindings
nnoremap <silent><nowait><A-z> :TZAtaraxis<CR>
nnoremap <silent><nowait><A-0> :NERDTreeToggle<CR>
" noremap 


