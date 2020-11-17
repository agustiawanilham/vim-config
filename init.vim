syntax on
filetype plugin indent on
set nocompatible " not vi compatible
set termguicolors
set nu 					                " number lines
set rnu 		
set noshowmode 	
set mouse=       
set ruler         
set updatetime=50  
set nowrap
set shortmess+=c
set noswapfile
set nobackup
set completeopt=menuone,noinsert,noselect
set noerrorbells
set regexpengine=1
set cursorline
set clipboard+=unnamedplus
set incsearch    
set hlsearch    
set ignorecase 
set smartcase 
set backspace=start,eol,indent
set wildmenu
set wildmode=longest:full,full:

set timeoutlen=1000
set ttimeoutlen=50

set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

set lazyredraw
set hidden              
set signcolumn=yes
set splitbelow
set splitright

vnoremap < <gv
vnoremap > >gv

let mapleader = "\<Space>"

au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC

" Better Copy / Paste
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase          " Ignore case in searches by default
set smartcase           " But make it case sensitive if an uppercase is entered

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Terminal emulation
tnoremap <Esc> <C-\><C-n>
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir

call plug#begin('~/.vim/plugged')
Plug 'rstacruz/vim-closer'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'
" Plug 'SirVer/ultisnips'
Plug 'junegunn/goyo.vim'

"Javascript
Plug 'maxmellon/vim-jsx-pretty'
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'prettier/vim-prettier', {
			\ 'do': 'npm install',
			\ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

" C#
Plug 'dense-analysis/ale'

" LSP
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'lukas-reineke/format.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'

" Theme
Plug 'mhinz/vim-startify'
Plug 'itchyny/lightline.vim'
Plug 'ghifarit53/tokyonight-vim'
Plug 'gruvbox-community/gruvbox'


"Not used
" Plug 'vim-airline/vim-airline'
" Plug 'OmniSharp/omnisharp-vim'
" Plug 'jiangmiao/auto-pairs'

" Drop Coc, changes to lsp
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-tsserver', 'coc-eslint', 'coc-omnisharp', 'coc-prettier']

call plug#end()

let s:win32yank = '/mnt/c/tools/nvim/Neovim/bin/win32yank.exe'

if has('wsl')
    let g:clipboard = {
          \   'name': 'wslclipboard',
          \   'copy': {
          \      '+': '/mnt/c/tools/nvim/Neovim/bin/win32yank.exe -i --crlf',
          \      '*': '/mnt/c/tools/nvim/Neovim/bin/win32yank.exe -i --crlf',
          \    },
          \   'paste': {
          \      '+': '/mnt/c/tools/nvim/Neovim/bin/win32yank.exe -o --lf',
          \      '*': '/mnt/c/tools/nvim/Neovim/bin/win32yank.exe -o --lf',
          \   },
          \   'cache_enabled': 1,
          \ }
endif

inoremap jk <Esc>

" Theme and Styling
set background=dark
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_italic=1
let g:gruvbox_sign_column='bg0'
colorscheme gruvbox

" Theme and Styling
" let g:ale_fix_on_save = 1
" let g:ale_linters = {
"       \'javascript': ['eslint', 'prettier'],
"       \'typescript': ['eslint', 'prettier'],
"       \}
" let g:ale_javascript_prettier_use_local_config = 1
" let g:ale_sign_column_always = 1
" let g:ale_completion_enabled = 0
" let g:ale_completion_tsserver_autoimport = 1
" let g:ale_fixers = {
"       \'javascript': ['eslint', 'prettier'],
"       \'json': ['prettier'],
"       \'typescript': ['eslint', 'prettier'],
"       \'markdown': ['prettier'],
"       \}
" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" nmap <leader>f <Plug>(ale_fix)
" nmap <silent> <leader>[ <Plug>(ale_previous_wrap)
" nmap <silent> <leader>] <Plug>(ale_next_wrap)

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']
let g:completion_enable_auto_hover = 0

" For Completion
:lua << EOF
  local nvim_lsp = require('lspconfig')
  local on_attach = function(_, bufnr)
    require('completion').on_attach()
  end

  local servers = {'tsserver', 'omnisharp'}
  for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
      on_attach = on_attach,
    }
  end

  --[[
	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	  vim.lsp.diagnostic.on_publish_diagnostics, {
	    -- This will disable virtual text, like doing:
	    -- let g:diagnostic_enable_virtual_text = 0
	    virtual_text = true,

	    -- This is similar to:
	    -- let g:diagnostic_show_sign = 1
	    -- To configure sign display,
	    --  see: ":help vim.lsp.diagnostic.set_signs()"
	    signs = true,

	    -- This is similar to:
	    -- "let g:diagnostic_insert_delay = 1"
	    update_in_insert = false,
	  }
	)
  --]]

  require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
      enable = true,              -- false will disable the whole extension
    },
  }

  nvim_lsp.diagnosticls.setup{
    on_attach= on_attach,
    filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'css', 'scss', 'markdown', 'pandoc' },
    init_options = {
      linters = {
        eslint = {
          command = 'eslint',
          rootPatterns = { '.git' },
          debounce = 100,
          args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
          sourceName = 'eslint',
          parseJson = {
            errorsRoot = '[0].messages',
            line = 'line',
            column = 'column',
            endLine = 'endLine',
            endColumn = 'endColumn',
            message = '[eslint] ${message} [${ruleId}]',
            security = 'severity'
          },
          securities = {
            [2] = 'error',
            [1] = 'warning'
          }
        },
        markdownlint = {
          command = 'markdownlint',
          rootPatterns = { '.git' },
          isStderr = true,
          debounce = 100,
          args = { '--stdin' },
          offsetLine = 0,
          offsetColumn = 0,
          sourceName = 'markdownlint',
          securities = {
            undefined = 'hint'
          },
          formatLines = 1,
          formatPattern = {
            '^.*:(\\d+)\\s+(.*)$',
            {
              line = 1,
              column = -1,
              message = 2,
            }
          }
        }
      },
      filetypes = {
        javascript = 'eslint',
        javascriptreact = 'eslint',
        typescript = 'eslint',
        typescriptreact = 'eslint',
        markdown = 'markdownlint',
        pandoc = 'markdownlint'
      },
      formatters = {
        prettierEslint = {
          command = 'prettier-eslint',
          args = { '--stdin' },
          rootPatterns = { '.git' },
        },
        prettier = {
          command = 'prettier',
          args = { '--stdin-filepath', '%filename' }
        }
      },
      formatFiletypes = {
         css = 'prettier',
         javascript = 'prettierEslint',
         javascriptreact = 'prettierEslint',
         json = 'prettier',
         scss = 'prettier',
         typescript = 'prettierEslint',
         typescriptreact = 'prettierEslint'
      }
    }
  }

EOF

nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gs <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>

nnoremap <silent> <leader>f <cmd>lua vim.lsp.buf.formatting()<CR>
vnoremap <silent> <leader>f <cmd>lua vim.lsp.buf.formatting()<CR><ESC>

nnoremap <Leader>fg <cmd>lua require'telescope.builtin'.git_files{}<CR>
nnoremap <Leader>ff <cmd>lua require'telescope.builtin'.find_files{}<CR>
nnoremap <silent>gr <cmd>lua require'telescope.builtin'.lsp_references{}<CR>

nnoremap <leader>[ <cmd>lua vim.lsp.diagnostic.goto_prev() <CR>
nnoremap <leader>] <cmd>lua vim.lsp.diagnostic.goto_next() <CR>

nnoremap <leader>dl <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>
