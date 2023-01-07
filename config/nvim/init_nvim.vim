luafile ~/.config/nvim/lua/init.lua
" plugins 
call plug#begin()
Plug 'vbe0201/vimdiscord'
Plug 'rust-lang/rust.vim'
Plug 'EdenEast/nightfox.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" settings
let g:rust_clip_command = 'xclip -selection clipboard'
set sessionoptions-=options
set noswapfile
set autoread
set foldmethod=marker
set clipboard+=unnamedplus        " Enable copy to system clipboard
"execute pathogen#infect()
set fillchars=eob:\ 
syntax on
filetype plugin indent on
let g:hexmode_patterns = '*.bin,*.exe,*.dat,*.o'
let g:hexmode_xxd_options = '-g 1'
" for coc 
nnoremap <silent> <C-t> :NvimTreeOpen ()<CR>
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
set hlsearch!
""" Customize colors
let g:sonokai_transparent_background = 1
source ~/.config/nvim/color-shusia.vim
"hi! Pmenu cterm=bold ctermbg=red guifg='#8ec07c' guibg='#282828' 
"hi! PmenuSel cterm=bold ctermbg=red guifg='#c94314'  guibg='#000000'
"hi! PmenuSbar cterm=bold ctermbg=red guifg='#8ec07c' guibg='#282828'
"hi! PmenuThumb cterm=bold ctermbg=red guifg='#8ec07c' guibg='#282828'
"highlight IndentBlanklineChar guifg=#000000 gui=nocombine
autocmd FileType json syntax match Comment +\/\/.\+$+
let g:coc_global_extensions = ['coc-json']


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
nnoremap <silent> K :call <SID>show_documentation()<CR>
"autocmd CursorHold * silent call <SID>show_documentation()
"source ~/.config/nvim/coc.vim
" Airline 
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline# = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '/'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme = 'powerlineish'
set showtabline=2
let g:Powerline_symbols = 'fancy'
" for coc setting 

let g:coc_global_extensions = [
    \ 'coc-discord-rpc',
	\ 'coc-json',
\ ]

highlight! link tomlKey Red
highlight! link tomlBoolean Blue
highlight! link tomlString Green
highlight! link tomlTable Red 
highlight! link tomlTableArray Purple

" for hex mod use :%!xxd
