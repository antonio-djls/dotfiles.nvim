local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("cpp", {
  s("comp", {
    t({
      "#include <bits/stdc++.h>",
      "#define ll long long",
      "#define f first",
      "#define s second",
      "using namespace std;",
      "",
      "int main() {",
      "  ios::sync_with_stdio(false);",
      "  cin.tie(nullptr);",
      "  ",
    }),
    i(1),
    t({
      "",
      "  return 0;",
      "}",
    }),
  }),
})
