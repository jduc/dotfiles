return {
  "benlubas/molten-nvim",
  version = "^1.0.0",
  build = ":UpdateRemotePlugins",
  ft = { "python" },
  init = function()
    vim.g.molten_output_win_max_height = 20
    vim.g.molten_auto_open_output = true
    vim.g.molten_virt_text_output = true
  end,
  keys = {
    { "<leader>mi", "<cmd>MoltenInit<cr>", desc = "Molten init" },
    { "<leader>mo", "<cmd>MoltenEvaluateOperator<cr>", desc = "Molten eval operator" },
    { "<leader>ml", "<cmd>MoltenEvaluateLine<cr>", desc = "Molten eval line" },
    { "<leader>mr", "<cmd>MoltenReevaluateCell<cr>", desc = "Molten re-eval cell" },
    { "<leader>mv", ":<C-u>MoltenEvaluateVisual<cr>gv", mode = "v", desc = "Molten eval visual" },
    { "<leader>mh", "<cmd>MoltenHideOutput<cr>", desc = "Molten hide output" },
    { "<leader>ms", "<cmd>noautocmd MoltenEnterOutput<cr>", desc = "Molten show/enter output" },
  },
}
