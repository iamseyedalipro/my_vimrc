filetype indent on                  " load filetype-specific indent files
syntax enable                       " enable syntax highlighting

set wildmenu                        " visual autocomplete for command menu
set showmatch                       " highlight matching !!important!!
set tabstop=4                       " number of visual spaces per tab
set softtabstop=4                   " number of spaces in tab while editing
set shiftwidth=4                    " when indenting with >, user 4 spaces width
set expandtab                       " tabs are spaces
set number                          " show line numbers
set showcmd                         " show command in bottom bar
set cursorline                      " highlight current line
set mouse=a                         " mouse support?
set vb t_vb=                        " no visual bell & flash
set clipboard=unnamed

call plug#begin('~/.vim/plugged')       " vim-plug plugins will be downloaded there
Plug 'preservim/nerdtree'               " file system explorer
Plug 'davidhalter/jedi-vim'             " jedi autocomplete code
Plug 'mattn/emmet-vim'                  " plugin for write tags fast
Plug 'vim-airline/vim-airline'          " nice colored bar the the bottom of the file
Plug 'terryma/vim-multiple-cursors'     " use multi cursors for change some texts
Plug 'Exafunction/codeium.vim', { 'branch': 'main' }
Plug 'tpope/vim-fugitive'               " git versioning and bar
Plug 'sheerun/vim-polyglot'             " syntax highlightning for different languages
Plug 'ervandew/supertab'                " tab autocomplete
Plug 'jiangmiao/auto-pairs'             " auto close brackets
Plug 'psf/black', {'tag': '19.10b0'}    " Black formatting
Plug 'plasticboy/vim-markdown'          " Markdown folding
Plug 'ctrlpvim/ctrlp.vim'               " Allows for quick searching of files
call plug#end()                         " vim-plugs should not be declared below this.

colorscheme slate  " set the colorscheme

" Configuration for vim-markdown plugin
autocmd FileType markdown let g:vim_markdown_new_list_item_indent = 0

" Because we dont want to screw with PEP 8
autocmd FileType python let g:black_linelength = 79         " max file length

" Configuration for ctrlp.vim plugin
autocmd VimEnter let g:ctrlp_working_path_mode = 'r'        " recursive
autocmd VimEnter let g:ctrlp_max_depth = 5                  " max directory depth
autocmd VimEnter let g:ctrlp_max_files = 100                " max files to parse
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/env/*,*/venv/*   " Ignore directories


" let g:jedi#completions_enabled = 1

" Optional: Use <Tab> to trigger completion
inoremap <silent><Tab> :call <SID>_smart_completion()<CR>

function! s:_smart_completion()
  if pumvisible()
    return "\<C-n>"
  else
    return "\<Tab>"
  endif
endfunction

" config for error monitoring
" Enable ALE
let g:ale_enable = 1

" Specify Python linters
let g:ale_linters = {
    \ 'python': ['flake8', 'pylint'],
    \}

" Automatically lint on text change and insert leave
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_on_insert_leave = 1

" Show error signs in the sign column
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '=='

" Enable virtual text to display errors inline
let g:ale_virtualtext_cursor = 1
let g:ale_virtualtext_prefix = '>> '
let g:ale_virtualtext_error = '>> '
let g:ale_virtualtext_warning = '!! '

" Disable automatic opening of the location list
let g:ale_open_list = 0

" ignore line long error
let g:ale_python_flake8_options = '--ignore=E501'
let g:ale_python_flake8_options = "--ignore=E303"
" Configure ALE to ignore specific pylint warning codes
let g:ale_python_pylint_options = '--disable=C0301'


" Automatically lint on text change and insert leave
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_on_insert_leave = 1

" Show error signs in the sign column
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '=='

" Enable virtual text to display errors inline
let g:ale_virtualtext_cursor = 1
let g:ale_virtualtext_prefix = '>> '
let g:ale_virtualtext_error = '>> '
let g:ale_virtualtext_warning = '!! '

" Disable automatic opening of the location list
let g:ale_open_list = 0

" Ignore line long error
let g:ale_python_flake8_options = '--ignore=E501'
let g:ale_python_flake8_options = "--ignore=E303"

" Configure ALE to ignore specific pylint warning codes
let g:ale_python_pylint_options = '--disable=C0301'


" My custom command
command! Nt NERDTreeToggle
nnoremap zn :NERDTreeToggle<CR>


let g:codeium_api_key = 'eyJhbGciOiJSUzI1NiIsImtpZCI6IjAyMTAwNzE2ZmRkOTA0ZTViNGQ0OTExNmZmNWRiZGZjOTg5OTk0MDEiLCJ0eXAiOiJKV1QifQ.eyJuYW1lIjoiU2V5ZWQgQWxpIEhvc2V5bmkiLCJwaWN0dXJlIjoiaHR0cHM6Ly9saDMuZ29vZ2xldXNlcmNvbnRlbnQuY29tL2EvQUNnOG9jSjZ0aEE5RnNRS3REZjdBZ1IzYlUzTldaMlhsU3djMHItSFo4RHJoU1hZUlE9czk2LWMiLCJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vZXhhMi1mYjE3MCIsImF1ZCI6ImV4YTItZmIxNzAiLCJhdXRoX3RpbWUiOjE3MjU2MzU1NjQsInVzZXJfaWQiOiJ4STdkV1BFRnoyYnFFWlJFa3lWcFYwTHN4cE0yIiwic3ViIjoieEk3ZFdQRUZ6MmJxRVpSRWt5VnBWMExzeHBNMiIsImlhdCI6MTcyNjIyMDY1OCwiZXhwIjoxNzI2MjI0MjU4LCJlbWFpbCI6ImlhbXNleWVkYWxpeEBnbWFpbC5jb20iLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJnb29nbGUuY29tIjpbIjEwNTg2MDU2NjA4ODU4MjU0NDEwMCJdLCJlbWFpbCI6WyJpYW1zZXllZGFsaXhAZ21haWwuY29tIl19LCJzaWduX2luX3Byb3ZpZGVyIjoiZ29vZ2xlLmNvbSJ9fQ.dkJgDVEwAv_RUDDMm9UBbflZ-GZpkT5q1U6SAWiKSA-SYmFhQSqbj0rCOV5XmxOmbvSOZWRjxChN-1OlaXqTYVKy-zGlFztWltHzUvakztckJNbKLSjciOAR9axVYtgcPA3i7QLPM1qoG1dHvJ30vmc7wzRf51m_vx5f6u5QiA6CttAsv7-abg8mc2-TCxQwDORmPvRwsr6zzmx3IEpmi5Xqm7UGzLuFE2bDN3gLtvL_yLKuyWWIMGUaAeNCZlvbeLuDh9K2m-YKlBa8kuleokfZdOHLjt7MbFrtRf973fzqMrUOiLVojWWAC7jdCeRKAD_koGH3lvH4HUSOM2Pm2Q'
let g:codeium#complete = '<Tab>'



"
