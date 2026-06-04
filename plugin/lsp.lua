local lsp_group = vim.api.nvim_create_augroup("lsp", { clear = true })

vim.lsp.enable("lua_ls", "gopls")
vim.lsp.codelens.enable(true)

vim.api.nvim_create_autocmd("LspAttach", {
  group = lsp_group,
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if not client then
      return
    end

    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end

    if not client:supports_method("textDocument/willSaveWaitUntil")
        and client:supports_method("textDocument/formatting") then
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = lsp_group,
        buffer = ev.buf,
        callback = function()
          vim.lsp.buf.format({
            bufnr = ev.buf,
            id = client.id,
            async = false,
            timeout_ms = 1000,
          })
        end,
      })
    end
  end,
})
