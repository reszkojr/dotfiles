require("mini.surround").setup({
  mappings = {
    add = "sa",
    delete = "sd",
    find = "sf",
    find_left = "sF",
    highlight = "sh",
    replace = "sr",
    update_n_lines = "sn",
  },
  n_lines = 50,
  custom_surroundings = {
    ["*"] = {
      input = function()
        return vim.fn.input("Surround with: ")
      end,
      output = function(input)
        return { input, input }
      end,
    },
  },
})
