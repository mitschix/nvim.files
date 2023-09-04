-- workaround for command abbrev in lua
-- not existing yet
local cabbrev = function(input, replace)
  local cmd = 'cnoreabbrev %s %s'
  vim.cmd(cmd:format(input, replace))
end

-- " Typo fix Setting {{{
-- " no one is really happy until you have this shortcuts
-- cabbrev('W!', 'w!')
-- cabbrev('Q!', 'q!')
cabbrev('Qall!','qall!')
cabbrev('Wq', 'wq')
cabbrev('Wa', 'wa')
cabbrev('wQ', 'wq')
cabbrev('WQ', 'wq')
cabbrev('W','w')
cabbrev('Q','q')
cabbrev('Qall', 'qall')
cabbrev('help', 'vertical help')
-- }}}
