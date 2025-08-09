local imgPath = vim.fn.stdpath 'config' .. '\\meow.png'
imgPath = imgPath:gsub('\\', '/')
-- ..
if vim.o.columns < 135 then
  Dashboard = {
    sections = {
      {
        section = 'terminal',
        cmd = 'chafa ' .. imgPath .. ' --format symbols --symbols vhalf --size 30x10 --align center',
        height = 10,
        padding = 1,
      },
      { section = 'startup' },
      { section = 'keys' },
    },
  }
else
  Dashboard = {
    width = 60,
    pane_gap = 16,
    preset = {
      header = [[
      ___           ___           ___           ___     
     /\  \         /\__\         /\  \         /\  \    
    |::\  \       /:/ _/_       /::\  \       _\:\  \   
    |:|:\  \     /:/ /\__\     /:/\:\  \     /\ \:\  \  
  __|:|\:\  \   /:/ /:/ _/_   /:/  \:\  \   _\:\ \:\  \ 
 /::::|_\:\__\ /:/_/:/ /\__\ /:/__/ \:\__\ /\ \:\ \:\__\
 \:\~~\  \/__/ \:\/:/ /:/  / \:\  \ /:/  / \:\ \:\/:/  /
  \:\  \        \::/_/:/  /   \:\  /:/  /   \:\ \::/  / 
   \:\  \        \:\/:/  /     \:\/:/  /     \:\/:/  /  
    \:\__\        \::/  /       \::/  /       \::/  /   
     \/__/         \/__/         \/__/         \/__/    
      ]],
    },
    sections = {
      {
        section = 'header',
        align = 'center',
        enabled = function()
          return not (vim.o.columns > 135)
        end,
      },
      {
        pane = 1,
        {
          enabled = function()
            return vim.o.columns > 135
          end,
          section = 'terminal',
          cmd = 'chafa ' .. imgPath .. ' --size 50x50 --format symbols --symbols vhalf --align center',
          height = 32,
          width = 56,
          padding = 1,
        },
        {
          section = 'startup',
          padding = 1,
          enabled = function()
            return vim.o.columns > 135
          end,
        },
      },
      {
        pane = 2,
        {
          section = 'header',
          align = 'center',
          enabled = function()
            return vim.o.columns > 135
          end,
        },
        {
          section = 'keys',
          padding = 2,
          gap = 1,
          enabled = function()
            return not (vim.o.columns < 135)
          end,
        },
        -- {
        --   icon = ' ',
        --   title = 'Recent Files',
        -- },
        -- {
        --   section = 'recent_files',
        --   opts = { limit = 3 },
        --   indent = 2,
        --   padding = 1,
        -- },
        -- {
        --   icon = ' ',
        --   title = 'Projects',
        --   enabled = function()
        --     return vim.o.columns > 135
        --   end,
        -- },
        -- {
        --   section = 'projects',
        --   opts = { limit = 3 },
        --   indent = 2,
        --   padding = 1,
        --   enabled = function()
        --     return vim.o.columns > 135
        --   end,
        -- },
        -- {
        --   section = 'startup',
        --   padding = 1,
        --   enabled = function()
        --     return not (vim.o.columns > 135)
        --   end,
        -- },
      },
    },
  }
end

return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      bigfile = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      dashboard = Dashboard,
      words = { enabled = true },
      input = { enabled = true },
      picker = {
        enabled = true,
        exclude = {
          '.git',
          'node_modules/',
          'vendor/',
        },
      },
      -- explorer = { enabled = true },
      statuscolumn = { enabled = true },
      indent = {
        priority = 1,
        enabled = true,
        only_scope = true,
        only_current = true,
        animate = {
          enabled = false,
        },
      },
      terminal = {
        win = {
          position = 'float',
          border = 'rounded',
        },
      },
    },
    keys = {
      {
        '\\',
        function()
          Snacks.explorer()
        end,
        desc = 'File Explorer',
      },
      {
        '<leader>sh',
        function()
          Snacks.picker.help()
        end,
        desc = '[S]earch [H]elp',
      },
      {
        '<leader>sk',
        function()
          Snacks.picker.keymaps()
        end,
        desc = '[S]earch [K]eymaps',
      },
      {
        '<leader><leader>',
        function()
          Snacks.picker.files {
            hidden = true,
            ignored = true,
            layout = {
              -- preview = 'main',
              preset = 'bottom',
            },
          }
        end,
        desc = '[S]earch [F]iles',
      },
      {
        '<leader>ss',
        function()
          Snacks.picker()
        end,
        desc = '[S]earch [S]elect',
      },
      {
        '<leader>sw',
        function()
          Snacks.picker.grep_word()
        end,
        desc = '[S]earch current [W]ord',
      },
      {
        '<M-/>',
        function()
          Snacks.picker.grep()
        end,
        desc = '[S]earch by [G]rep',
      },
      {
        '<leader>sd',
        function()
          Snacks.picker.diagnostics()
        end,
        desc = '[S]earch [D]iagnostics',
      },
      {
        '<leader>sr',
        function()
          Snacks.picker.resume()
        end,
        desc = '[S]earch [R]esume',
      },
      {
        '<leader>b',
        function()
          Snacks.picker.buffers()
        end,
        desc = 'Find existing [b]uffers',
      },
      {
        'ff',
        function()
          if vim.fn.isdirectory '.git' == 1 then
            Snacks.picker.git_files()
          else
            Snacks.picker.files()
          end
        end,
        desc = '[S]earch [F]iles',
      },
      {
        '<leader>lg',
        function()
          Snacks.lazygit()
        end,
        desc = '[l]azy [g]it',
      },
      {
        '<leader>.',
        function()
          Snacks.scratch()
        end,
        desc = 'Toggle Scratch Buffer',
      },
      {
        '<leader>sb',
        function()
          Snacks.picker.git_branches()
        end,
        desc = '[s]witch git [b]ranch',
      },
      {
        '<leader>gl',
        function()
          Snacks.picker.git_log_line()
        end,
        desc = '[g]it log [l]ine',
      },
      {
        '<leader>gf',
        function()
          Snacks.picker.git_log_file()
        end,
        desc = 'git [l]og [f]ile',
      },
      {
        '<leader>sl',
        function()
          local line = vim.fn.getline '.'
          Snacks.picker.lines {
            search = line,
          }
        end,
        desc = 'Search [L]ine under cursor',
      },
      {
        ']]',
        function()
          Snacks.words.jump(vim.v.count1)
        end,
        desc = 'Next Reference',
      },
      {
        '[[',
        function()
          Snacks.words.jump(-vim.v.count1)
        end,
        desc = 'Prev Reference',
      },
      {
        '<leader>/',
        function()
          Snacks.picker.lines {
            layout = {
              preview = 'main',
              preset = 'vertical',
            },
          }
        end,
        desc = 'search in current buffer',
      },
      {
        '<M-h>',
        function()
          Snacks.terminal.toggle()
        end,
        desc = 'Toggle terminal',
        mode = { 'n', 't' },
      },
      {
        '<M-g>',
        function()
          if vim.fn.isdirectory '.git' == 1 then
            Snacks.picker.files {
              title = 'Modified Files (git)',
              layout = 'select',
              finder = function()
                local output = vim.fn.systemlist 'git status --porcelain=v1 -uall'
                local items = {}
                for _, file in ipairs(output) do
                  local status = file:sub(1, 2)
                  local filepath = file:sub(4)
                  filepath = vim.fn.fnamemodify(filepath, ':p:.')
                  if vim.fn.filereadable(filepath) == 1 then
                    table.insert(items, {
                      text = filepath,
                      path = filepath,
                      file = filepath,
                      status = status,
                    })
                  end
                end
                return items
              end,
              format = function(item)
                local status_info = ({
                  ['M '] = { icon = '~' },
                  [' M'] = { icon = '~' },
                  ['MM'] = { icon = '~' },
                  ['A '] = { icon = '+' },
                  ['??'] = { icon = '?' },
                  ['D '] = { icon = 'X' },
                  [' D'] = { icon = 'X' },
                  ['R '] = { icon = 'R' },
                  ['C '] = { icon = 'C' },
                  ['U '] = { icon = 'U' },
                })[item.status] or { icon = '?' }
                return {
                  { status_info.icon .. ' ', 'SnacksPickerGitStatus' },
                  { item.text, 'SnacksPickerFile' },
                }
              end,
            }
          else
            Snacks.picker.files { layout = 'select' }
          end
        end,
        desc = 'Pick [m]odified [g]it files',
      },
    },
  },
}
