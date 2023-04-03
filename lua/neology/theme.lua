local M = {}

function M.setup(opts)
  local c = require('neology.colors').setup()

  local highlights = {
    Normal                    = { bg = c.bg, fg = c.norm }, -- base (default) highlight gr to resort to
    ColorColumn               = { bg = c.mute4 },
    Comment                   = { fg = c.mute3, gui = 'italic' },
    Conditional               = { fg = c.mute2 },
    Constant                  = { fg = c.mute2 },
    Cursor                    = { bg = c.mute5, fg = c.mute2 },
    CursorColumn              = { bg = c.mute6 },
    CursorLine                = { bg = c.mute6 },
    CursorLineNr              = { fg = c.mute2, gui = 'bold' },
    Delimiter                 = { fg = c.mute2 },
    DiffAdd                   = { fg = c.green },
    DiffChange                = { fg = c.yellow },
    DiffDelete                = { fg = c.red },
    DiffText                  = { fg = c.blue },
    Directory                 = { fg = c.mute1, gui = 'bold' },
    Error                     = { fg = c.fg, bg = c.red },
    ErrorMsg                  = { fg = c.red, bg = c.mute3 },
    FoldColumn                = { fg = c.mute2 },
    Folded                    = { fg = c.mute3 },
    -- Function                  = { fg = c.fg, gui = 'italic' },
    Identifier                = { fg = c.fg },
    Ignore                    = { fg = c.bg },
    IncSearch                 = { fg = c.bg, bg = c.mute1 },
    Include                   = { fg = c.mute2 },
    Keyword                   = { fg = c.mute2, gui = 'italic' },
    LineNr                    = { fg = c.mute4 },
    MatchParen                = { bg = c.mute2, fg = c.mute1 },
    ModeMsg                   = { gui = 'bold' },
    MoreMsg                   = { fg = c.mute3, gui = 'bold' },
    NonText                   = { bg = c.bg, fg = c.mute3 },
    Operator                  = { fg = c.mute2 },
    Pmenu                     = { fg = c.mute1, bg = c.mute6 },
    PmenuSbar                 = { fg = c.mute1, bg = c.mute4 },
    PmenuSel                  = { fg = c.fg, bg = c.pink },
    PmenuThumb                = { fg = c.mute1, bg = c.mute4 },
    PreProc                   = { fg = c.mute1 },
    Question                  = { fg = c.red },
    Repeat                    = { fg = c.mute2 },
    Search                    = { bg = c.mute5, gui = 'bold' },
    SignColumn                = { fg = c.green },
    Special                   = { fg = c.fg, gui = 'italic' },
    SpecialKey                = { fg = c.green },
    SpellBad                  = { gui = 'undercurl', sp = c.red },
    SpellCap                  = { gui = 'undercurl', sp = c.green },
    SpellLocal                = { gui = 'undercurl', sp = c.green },
    SpellRare                 = { gui = 'undercurl', sp = c.orange },
    Statement                 = { fg = c.mute2 },
    StatusLine                = { bg = c.mute6, fg = c.mute2 },
    StatusLineNC              = { bg = c.mute6, fg = c.mute4 },
    StorageClass              = { link = 'Type' },
    String                    = { fg = c.mute2, gui = 'italic' },
    Structure                 = { link = 'Type' },
    TabLine                   = { fg = c.mute1, bg = c.mute6 },
    TabLineFill               = { fg = c.mute1, bg = c.mute6 },
    TabLineSel                = { fg = c.fg, bg = c.pink, gui = 'bold' },
    Tag                       = { link = 'Special' },
    Title                     = { fg = c.mute2, gui = 'bold' },
    Todo                      = { fg = c.pink, gui = 'underline' },
    Type                      = { fg = c.mute2, gui = 'italic' },
    Typedef                   = { link = 'Type' },
    Underlined                = { fg = c.mute1, gui = 'underline' },
    VertSplit                 = { bg = c.mute6, fg = c.mute6 },
    Visual                    = { fg = c.fg, bg = c.mute5 },
    VisualNOS                 = { bg = c.mute4 },
    WarningMsg                = { bg = c.mute5, fg = c.yellow },
    WildMenu                  = { fg = c.bg, bg = c.mute1 },
    WinBar                    = { link = 'StatusLine' },
    WinBarNC                  = { link = 'StatusLineNC' },
    qfLineNr                  = { fg = c.mute2 },
    StatusLineTerm            = { fg = c.mute2 },
    StatusLineTermNC          = { fg = c.bg, bg = c.mute2 },
    ToolbarLine               = { bg = c.mute2, fg = c.bg },
    ToolbarButton             = { bg = c.mute2, fg = c.bg },
    --
    -- Set specific Treesitter node tags
    ["@conditional"]          = { link = 'Conditonal' }, -- 'if'
    ["@include"]              = { link = 'Include' },
    ["@keyword"]              = { link = 'Keyword' },
    ["@operator"]             = { link = 'Operator' },
    ["@punctuation"]          = { link = 'Delimiter' },
    ["@punctuation.bracket"]  = { link = 'Delimiter' },
    -- ["@punctuation.special"]  = { link = 'Delimiter' },
    ["@repeat"]               = { link = 'Repeat' }, -- 'for' loop
    ["@string"]               = { link = 'String' },
    ["@type"]                 = { link = 'Type' },
    ["@type.qualifier"]       = { link = 'Type' },
    -- var hierarchy
    -- ["@variable"]             = { fg = c.fg, gui = 'italic' }, -- parent
    -- ["@attribute"]            = { gui = 'NONE' },
    -- ["@field"]                = { gui = 'NONE' },
    -- ["@function"]             = { gui = 'italic' },
    -- ["@method"]               = { gui = 'italic' },
    -- ["@parameter"]            = { gui = 'NONE' },
    --
    ["@comment"]              = { link = 'Comment' },
    --
    ["@constant"]             = { link = 'Constant' },
    ["@number"]               = { link = 'Constant' },
    -- LSP diagnostics
    DiagnosticUnderlineError  = { gui = 'undercurl', sp = c.red },
    DiagnosticUnderlineWarn   = { gui = 'undercurl', sp = c.orange },
    DiagnosticUnderlineInfo   = { gui = 'undercurl', sp = c.green },
    DiagnosticUnderlineHint   = { gui = 'undercurl', sp = c.green },
    -- Syntastic
    SyntasticWarningSign      = { fg = c.yellow },
    SyntasticWarning          = { bg = c.yellow, fg = c.black, gui = 'bold' },
    SyntasticErrorSign        = { fg = c.red },
    SyntasticError            = { bg = c.red, fg = c.white, gui = 'bold' },
    -- which-key.nvim
    WhichKey                  = { bg = c.bg, fg = c.pink, gui = 'bold' },
    WhichKeyDesc              = { bg = c.bg, fg = c.mute2, gui = 'bold' },
    WhichKeySeparator         = { bg = c.bg, fg = c.mute1, gui = 'bold' },
    WhichKeyFloat             = { bg = c.bg },
    WhichKeyGroup             = { link = 'WhichKey' },
    -- Neomake
    NeomakeWarningSign        = { link = 'SyntasticWarningSign' },
    NeomakeErrorSign          = { link = 'SyntasticErrorSign' },
    -- ALE
    ALEWarningSign            = { link = 'SyntasticWarningSign' },
    ALEErrorSign              = { link = 'SyntasticErrorSign' },
    -- Signify, git-gutter
    SignifySignAdd            = { fg = c.mute2 },
    SignifySignDelete         = { link = 'SignifySignAdd' },
    SignifySignChange         = { link = 'SignifySignAdd' },
    GitGutterAdd              = { link = 'SignifySignAdd' },
    GitGutterDelete           = { link = 'SignifySignAdd' },
    GitGutterChange           = { link = 'SignifySignAdd' },
    GitGutterChangeDelete     = { link = 'SignifySignAdd' },
    -- Markdown
    markdownCode              = { fg = c.mute2 },
    markdownLinkReference     = { fg = c.mute2 },
    markdownJekyllFrontMatter = { fg = c.mute2 },
    markdownCodeBlock         = { fg = c.mute1 },
    markdownCodeDelimiter     = { fg = c.mute1 },
    markdownHeadingDelimiter  = { fg = c.fg },
    markdownRule              = { fg = c.mute2 },
    markdownHeadingRule       = { fg = c.mute2 },
    htmlH1                    = { gui = 'bold' },
    htmlH2                    = { gui = 'bold' },
    htmlH3                    = { gui = 'bold' },
    htmlH4                    = { gui = 'bold' },
    htmlH5                    = { gui = 'bold' },
    htmlH6                    = { gui = 'bold' },
    mkdDelimiter              = { fg = c.fg },
    markdownId                = { fg = c.mute2 },
    markdownBlockquote        = { fg = c.mute2 },
    markdownItalic            = { fg = c.mute2, gui = 'italic' },
    mkdBold                   = { fg = c.fg, gui = 'bold' },
    mkdInlineURL              = { fg = c.fg, gui = 'italic' },
    mkdListItem               = { fg = c.fg },
    markdownOrderedListMarker = { fg = c.fg },
    mkdlink                   = { fg = c.fg, gui = 'bold' },
    markdownLinkDelimiter     = { fg = c.fg },
    mkdURL                    = { fg = c.mute2, gui = 'italic' },
    -- fidget.nvim
    FidgetTask                = { fg = c.mute6 },
    FidgetTitle               = { fg = c.mute6 },
    -- indent-blankline
    IndentBlanklineIndent1    = { fg = c.mute5, gui = 'nocombine' },
    IndentBlanklineIndent2    = { link = 'IndentBlanklineIndent1' },
    IndentBlanklineIndent3    = { link = 'IndentBlanklineIndent1' },
    IndentBlanklineIndent4    = { link = 'IndentBlanklineIndent1' },
    IndentBlanklineIndent5    = { link = 'IndentBlanklineIndent1' },
    IndentBlanklineIndent6    = { link = 'IndentBlanklineIndent1' },
    -- lualine
    -- lualine_y_buffers_active   = { fg = c.mute1 },
    -- lualine_y_buffers_inactive = { fg = c.mute5 },
  }

  if opts and opts.highlights then
    highlights = vim.tbl_deep_extend('force', highlights, opts.highlights)
  end

  return highlights
end

return M
