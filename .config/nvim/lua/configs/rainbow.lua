-- This module contains a number of default definitions
local rainbow_delimiters = require 'rainbow-delimiters'

require('rainbow-delimiters.setup').setup {
    strategy = {
        [''] = rainbow_delimiters.strategy['global'],
        commonlisp = rainbow_delimiters.strategy['local'],
    },
    query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
        html = 'rainbow-parens',
        tsx = 'rainbow-parens',
    },
    highlight = {
        'RainbowDelimiterRed',
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan',
    },
    -- blacklist = { 'c', 'cpp' },
}

