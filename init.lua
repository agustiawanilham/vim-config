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
