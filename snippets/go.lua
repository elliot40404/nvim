-- DOCS:
-- https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#snippets
--
-- GLOBAL VARS:
-- https://github.com/L3MON4D3/LuaSnip/blob/69cb81cf7490666890545fef905d31a414edc15b/lua/luasnip/config.lua#L82-L104§

local session = require 'luasnip.session'

local env = session.config.snip_env
local s = env['s']
local t = env['t']
local i = env['i']
local parse = env['parse']

return {

  s({ trig = 'iee', name = 'if err != nil', dscr = 'Insert if err != nil' }, {
    t 'if err != nil {',
    t '\tfmt.Printf("',
    i(1),
    t ' %#v\\n",err',
    i(2),
    t ')',
    t '}',
  }),

  parse(
    { trig = 'ma', name = 'Main Package', dscr = 'Basic main package structure' },
    [[
  package main

  import "fmt"

  func main() {
    fmt.Printf("Hello, World!\n")
  }
  ]]
  ),
}
