local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s({trig = "xor", name = "XOR Bytes", dscr = "XOR bytes() objects"},{
    t("bytes(x ^ y for x, y in zip("),
    i(1, "bytes1"),
    t(", "),
    i(2, "bytes2"),
    t("))"),
  }),
}
