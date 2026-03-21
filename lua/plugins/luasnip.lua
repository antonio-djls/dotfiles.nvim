return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  build = "make install_jsregexp",
  dependencies = {
    "rafamadriz/friendly-snippets",
    {
      "nvim-cmp",
      dependencies = {
        "saadparwaiz1/cmp_luasnip",
      },
    },
  },
  config = function()
    local ls = require("luasnip")

    -- Configuração básica
    ls.config.set_config({
      history = true,
      updateevents = "TextChanged,TextChangedI",
      enable_autosnippets = true,
    })

    -- Carrega snippets do friendly-snippets
    require("luasnip.loaders.from_vscode").lazy_load()

    -- Keymaps
    vim.keymap.set({ "i", "s" }, "<C-k>", function()
      if ls.expand_or_jumpable() then
        ls.expand_or_jump()
      end
    end, { silent = true, desc = "Expand or jump snippet" })

    vim.keymap.set({ "i", "s" }, "<C-j>", function()
      if ls.jumpable(-1) then
        ls.jump(-1)
      end
    end, { silent = true, desc = "Jump back in snippet" })

    -- Snippets personalizados C++
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

    -- Debug: verificar se foi carregado
    -- vim.api.nvim_create_autocmd("FileType", {
    --   pattern = "cpp",
    --   callback = function()
    --     print("C++ snippets loaded: " .. vim.inspect(ls.get_snippets("cpp")))
    --   end,
    -- })
  end,
}
