""Set line numbering
set number
"Set line highlight
set cursorline
"Setting no vim compat
set nocp
"Setting no swapfile
set noswapfile
"Setting encoding
set encoding=UTF-8
"set lazyredraw to scroll faster
set ttyfast
set lazyredraw
""""""""""""""""""""""""""""""""""""Open splits down and right
set splitbelow
set splitright
""""""""""""""""""""""""""""""""""""Open splits down and right
"allow to navigate unsaved buffers without prompting any error or warning
set hidden
""""""""""""""""""""""""""""""""""""Tabs
"Insert spaces instead of tabs it inserts (if defined) 'softtabstop' space chars
set expandtab
"Tab equivalent to n spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
"enable hlsearch
set hlsearch
"lines wont break screen
set nowrap
set signcolumn=yes
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

au BufRead,BufNewFile *.hcl set filetype=tf

""Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
""Let netrw ignore hidden files
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
""""""""""""""""""""""""""""""""""""mouse
"allows mouse selection to go into visual mode and more
set mouse=a
""""""""""""""""""""""""""""""""""""vundle
"Vundle installs plugins configured in vimrc with :BundleInstall
call plug#begin('~/.vim/plugged')
"""""""""""""""""""""""""""""""""""""Plugins
"Bundles to install
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'dominickng/fzf-session.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'mhinz/vim-startify'
Plug 'junegunn/fzf.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'chrisbra/Colorizer'
Plug 'morhetz/gruvbox'
Plug 'terryma/vim-multiple-cursors'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf'
Plug 'vim-airline/vim-airline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmsvg/pear-tree'
Plug 'vimwiki/vimwiki'
Plug 'michal-h21/vim-zettel'
Plug 'meain/vim-package-info'
Plug 'mhinz/vim-crates'
Plug 'ryanoasis/vim-devicons'
Plug 'honza/vim-snippets'
Plug 'christianrondeau/vim-base64'
Plug 'vim-test/vim-test'
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'

call plug#end()

"render man pages
runtime ftplugin/man.vim

" Startify sessions configuration
" Search on sessions
let g:fzf_session_path = $HOME . '/.local/share/nvim/session'
nnoremap <leader>s :Sessions<CR>
" Automatically persist sessions
let g:startify_session_persistence = 1
""""""""""""""""""""""""""""""""""""MAPPINGS
"macro for copying filename to clipboard
nmap <silent> cp :let @+=expand("%")<CR>
"hlsearch disable with space
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
"Search in command history without losing history filter
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
""""""""""""""""""""""""""""""""""""moving through splits
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" Move around when in terminal mode
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
""""""""""""""""""""""""""""""""""""moving through splits
""""""""""""""""""""""""""""""""""""change current working dir
nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>
""""""""""""""""""""""""""""""""""""Colors
set background=dark
"colorscheme solarized8_flat
colorscheme gruvbox
"colorscheme base16-default-dark
""""""""""""""""""""""""""""""""""""Colors
""""""""""""""""""""""""""""""""""""fzf
"maps \e to open fuzzy finding
nnoremap <Leader>e :Files<CR>
"maps \ag to open ag content fuzzy finding
nnoremap <Leader>ag :Rg<CR>
" Adds preview to ripgrep search
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
"maps \b to navigate open buffers
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>l :BLines<CR>
""""""""""""""""""""""""""""""""""""fzf
""""""""""""""""""""""""""""""""""""Fugitive
set diffopt+=vertical
nmap <leader>g :G<CR>
" Open branches on file in quickfix with fzf
nmap <leader>gc :GCheckout<CR>
" Open commits on file in quickfix with fzf
nmap <leader>gl :BCommits<CR>
" Opens commits log for all repo
nmap <leader>gL :Commits<CR>
nmap <leader>gP :G push origin<CR>
nmap <leader>gp :G pull origin<CR>
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
""""""""""""""""""""""""""""""""""""Fugitive
""""""""""""""""""""""""""""""""""""Terminal on horizontal spit
nmap <leader>T :sp +te <CR>
""""""""""""""""""""""""""""""""""""Terminal on horizontal spit
""""""""""""""""""""""""""""""""""""END MAPPINGS
""""""""""""""""""""""""""""""""""""Airline
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
""""""""""""""""""""""""""""""""""""End Airline
""""""""""""""""""""""""""""""""""""Python paths
" Figure out the system Python for Neovim.
if exists("$VIRTUAL_ENV")
    let g:python3_host_prog=substitute(system("which -a python3 | head -n2 | tail -n1"), "\n", '', 'g')
else
    let g:python3_host_prog=substitute(system("which python3"), "\n", '', 'g')
endif
""""""""""""""""""""""""""""""""""""Python paths
""""""""""""""""""""""""""""""""""""Bash Language server coc

let g:coc_global_extensions = [
      \'coc-markdownlint',
      \'coc-yaml',
      \'coc-sh',
      \'coc-pyright',
      \'coc-rust-analyzer',
      \'coc-json',
      \'coc-docker',
      \'coc-git',
      \'coc-diagnostic',
      \'coc-phpls',
      \]
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Select completion using cr
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Remap <C-f> and <C-b> for scroll float windows/popups.
"if has('nvim-0.4.0') || has('patch-8.2.0750')
"  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"  "nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
"  "inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
"  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"  "noremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"endif

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

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <F7> <Plug>(coc-codelens-action)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocFzfList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocFzfList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocFzfList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocFzfList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocFzfList symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocFzfListResume<CR>

""""""""""""""""""""""""""""""""""""VimWiki
" Disable - hotkey to remove header level
nmap <Leader>- <Plug>VimwikiRemoveHeaderLevel
""""""""""""""""""""""""""""""""""""Zettelkasten
let g:zettel_fzf_command = "rg --column --line-number --ignore-case --no-heading --color=always "
let g:zettel_default_mappings = 0

" Automatically open CratesToggle when opening cargo.toml
if has('nvim')
  autocmd BufRead Cargo.toml call crates#toggle()
endif
""""""""""""""""""""""""""""""""""""VimSpector
let g:vimspector_enable_mappings = 'HUMAN'

""""""""""""""""""""""""""""""""""""Java-debug
nmap <F1> :CocCommand java.debug.vimspector.start<CR>
""""""""""""""""""""""""""""""""""""Vim-test
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ta :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tg :TestVisit<CR>
let test#strategy = 'neovim'
let test#java#runner = 'gradletest'
