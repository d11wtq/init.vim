call plug#begin()

""" Tree-sitter for AST-based syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

""" Keyword tab completion
Plug 'ervandew/supertab'

""" Install fzf for fuzzy-find
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

""" Easy manipulation of surrounding parentheses, quotes etc
Plug 'tpope/vim-surround'

""" Inline replacement of visually selected text
Plug 'tommcdo/vim-express'

""" Make trailing whitespace noisy
Plug 'bronson/vim-trailing-whitespace'

""" A nice dark color scheme
Plug 'tyrannicaltoucan/vim-deep-space'

""" Initialize vim-plug
call plug#end()

""" Setting the leader to ';' is much easier to type
let mapleader = ";"

""" Setup the color scheme
set background=dark
set termguicolors
colorscheme deep-space

""" Show line numbers
set number

""" Force newline at end of file
set eol

""" Indent using spaces, not tabs
set expandtab
set shiftwidth=2
set softtabstop=2

""" Use the system clipboard when yanking/pasting
set clipboard=unnamed

""" The current directory is relative to the current file
set autochdir

""" Disable swap/backup files
set nobackup
set nowritebackup
set noswapfile

""" Read modeline comments from the start of files (e.g. tab settings)
set modeline
set modelines=5

""" Make file name completion work more like bash
set wildmode=longest,list

""" Show a right margin indicator by default
set colorcolumn=80

""" Enter turns off any highlighted matches, then acts as normal
nnoremap <CR> :noh<CR><CR>

""" Pressing <tab> toggles invisible tabs/spaces on/off
nnoremap <Tab> :set list!<CR>

""" Pressing <space> toggles the right margin indicator
nnoremap <Space> :call v:lua.toggle_colorcolumn()<CR>

""" Select a block and hit C-o to open that block with spaces
vnoremap <C-o> yPgvr<Space>

""" Select text that was just pasted
nnoremap gp `[v`]

""" Opens the init.vim
nnoremap <Leader>/ :e $MYVIMRC<CR>

""" Shortcuts for fzf
nnoremap <C-b> :Buffers<CR>
nnoremap <C-p> :GFiles<CR>

""" Lua definitions follow
lua << ENDLUA

  -- Toggles vim's colorcolumn setting between 80 and none.
  function _G.toggle_colorcolumn()
    local old = vim.api.nvim_eval('&colorcolumn')
    local new = (old == '' and '80') or ''
    vim.api.nvim_command(string.format('set colorcolumn=%s', new))
  end

  -- Enable tree-sitter
  require'nvim-treesitter.configs'.setup {
    -- Languages we want to use
    ensure_installed = {
      'bash',
      'c',
      'clojure',
      'css',
      'go',
      'gomod',
      'graphql',
      'html',
      'javascript',
      'json',
      'lua',
      'python',
      'ruby',
      'scss',
      'tsx',
      'typescript',
      'vim',
      'yaml',
    },

    -- Turn on syntax highlighting
    highlight = { enable = true },
  }

ENDLUA
