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
  s("for", {
    t("for("),
    i(1),
    t(" "),
    i(2),
    t("="),
    i(3),
    t("; "),
    rep(2),
    t("<"),
    i(4),
    t("; "),
    rep(2),
    t({"++) {", "  ",}),
    i(5),
    t({"", "}"})
  }),
  s("while", {
    t("while( "),
    i(1),
    t({") {", "  ",}),
    i(2),
    t({"", "}", ""})
  }),
  s("dowhile", {
    t({ "do","{", "  " }),
    i(2),
    t({"", "}","while("}),
    i(1),
    t(")")
  }),
  s("switch", {
    t("switch( "),
    i(1),
    t({" )","{", "  case "}),
    i(2),
    t({":","", "  default:", "    ","","}"}),
    t({})
  }),
  s("if", {
    t("if("),
    i(1),
    t({") {", "  ",}),
    i(2),
    t({"", "}"})
  }),
  s("#if", {
    t({"#if("}),
    i(1),
    t({")","  "}),
    i(2),
    t({"", "#endif"})
  }),
  s("voidf", {
    t({"void ",}),
    i(1),
    t({" ("}),
    i(2),
    t({") {", "  "}),
    i(3),
    t({"", "}", ""})
  }),
  s("intf", {
    t({"int ",}),
    i(1),
    t({" ("}),
    i(2),
    t({") {", "  "}),
    i(3),
    t({"", "}", ""})
  }),
}

