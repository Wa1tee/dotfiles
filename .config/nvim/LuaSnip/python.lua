local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return{
   s("init", {
       t({"#!/usr/bin/env python3","","","def main():", "    "}),
       i(1),
       t({"return","","if __name__ == \"__main__\":", "    main()"}),
   }),
   s("def", {
       t({"def "}),
       i(1),
       t({":", "    "}),
       i(2),
   }),
}
