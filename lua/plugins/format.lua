return {
  "mhartington/formatter.nvim",
  config = function()
    require("formatter").setup({
      filetype = {
        java = {
          function()
            return {
              exe = "java",
              args = {
                "-jar",
                vim.fn.expand("~/Environment/google-java-format-1.25.2-all-deps.jar"),
                "--replace",
                vim.fn.expand("%:p"),
              },
              stdin = false,
            }
          end,
        },
      },
    })
  end,
}
