local session = require 'luasnip.session'

local env = session.config.snip_env
local s = env['s']
local t = env['t']
local i = env['i']
local parse = env['parse']

return {

  s({ trig = 'clg', name = 'console.log', dscr = 'console log' }, {
    t 'console.log(',
    i(1),
    t ')',
  }),
}
