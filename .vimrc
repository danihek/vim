syntax on
filetype plugin indent on
set ts=3 sts=2 sw=2 et ai si
set incsearch
set ignorecase
set wildmenu
set wildmode=list:longest
set number relativenumber
set nu rnu

call plug#begin()
  Plug 'Exafunction/codeium.vim', { 'branch': 'main' }
  Plug 'neoclide/coc.nvim'  
  Plug 'sheerun/vim-polyglot'
  Plug 'scrooloose/NERDTree'
  Plug 'jiangmiao/auto-pairs'
  Plug 'rafi/awesome-vim-colorschemes'
  Plug 'ap/vim-css-color'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'preservim/nerdtree'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-unimpaired'
call plug#end()

nnoremap <C-s> :e#<CR>
autocmd CursorHold * silent call CocActionAsync('highlight')

imap <script><silent><nowait><expr> <C-g> codeium#Accept()
imap <C-;>   <Cmd>call codeium#CycleCompletions(1)<CR>
imap <C-,>   <Cmd>call codeium#CycleCompletions(-1)<CR>
imap <C-x>   <Cmd>call codeium#Clear()<CR>

"""   sort by line length
"""   :0,$ ! awk '{ print length(), $0 | "sort -n | cut -d\\  -f2-" }'

""" Customize colors
func! s:my_colors_setup() abort
    " this is an example
    hi Pmenu guibg=#d7e5dc 
    hi PmenuSel guibg=#f70707
    hi PmenuSbar guibg=#bcbcbc
    hi PmenuThumb guibg=#8e1515
    hi CocFloating term=reverse ctermfg=15 ctermbg=9 guifg=White guibg=#492929
    hi CocMenuSel ctermbg=60 guibg=#303440
endfunc

augroup colorscheme_coc_setup | au!
    au ColorScheme * call s:my_colors_setup()
augroup END

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
 
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
 
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical" 
