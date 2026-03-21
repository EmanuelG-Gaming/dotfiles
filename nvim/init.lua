-- ~ Emanuel's Neovim config ~
--
-- It works on v0.12.0-dev, which is a bleeding-edge version of Neovim.
--
--
-- I am mostly a left-handed person. I don't really use the right-sided part of the keyboard's home row (the HJKL keys),
-- so I tend to use the arrow keys whenever I try navigating on a file or when playing a video game.
--
-- Will this affect my productivity in Neovim or in almost any other text editor? I think so, but I think I could adapt to this 

-- Neovim has native package management now! (version 0.12.0) 
vim.pack.add({
    -- Themes
    --{src = "https://github.com/vague2k/vague.nvim"},
    --{src = "https://github.com/ellisonleao/gruvbox.nvim"},
    {src = "https://github.com/olimorris/onedarkpro.nvim"},
    {src = "https://github.com/nvim-tree/nvim-web-devicons"}, -- For colored icons

    --{src = "https://github.com/stevearc/oil.nvim"},
    --{src = "https://github.com/echasnovski/mini.pick"}, -- A minimalist fuzzy finder
    {src = "https://github.com/nvim-telescope/telescope.nvim"}, -- Telescope is another popular fuzzy finder with more integrations and features
    {src = "https://github.com/neovim/nvim-lspconfig"},
    {src = "https://github.com/nvim-lua/plenary.nvim"},


    -- Other
    {src = "https://github.com/hrsh7th/nvim-cmp"},
    {src = "https://github.com/hrsh7th/cmp-nvim-lsp"},
    {src = "https://github.com/L3MON4D3/LuaSnip"}, -- For showing us the description/comments of the functions we use
    {src = "https://github.com/nvim-treesitter/nvim-treesitter"},
    {src = "https://github.com/mason-org/mason.nvim"}, -- Nice LSP installer
    {src = "https://github.com/folke/todo-comments.nvim"}, -- Highlights TODO in comments
    {src = "https://github.com/folke/which-key.nvim"},
    {src = "https://github.com/ThePrimeagen/harpoon", { version = "harpoon2" }}, -- Quickly find your files
    --{src = "https://github.com/akinsho/bufferline.nvim" }, -- Shows a top bar

    -- Miscellaneous
    {src = "https://github.com/NStefan002/speedtyper.nvim", { version = "v2" }} -- Typing exercises
})

-- Leader key
vim.g.mapleader = ' '
vim.g.localmapleader = ' '

-- Search options
vim.opt.ignorecase = true -- Case-insensitive searches
vim.opt.smartcase = true -- Searches becomes case-sensitive if you have an uppercase letter
vim.opt.hlsearch = true -- Highlight search results
vim.opt.incsearch = true -- Show matches as you type

vim.opt.inccommand = "split" -- Show effects of commands as you type them

-- Behaviour of the buffer
vim.opt.signcolumn = "yes"
vim.opt.cursorcolumn = false
vim.opt.wrap = false

-- Tabs/indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true -- Smart auto-indenting
vim.opt.autoindent = true -- Copy indent from current line



-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- Stylistic choices
vim.opt.termguicolors = true -- 24-bit colors
vim.opt.winborder = "rounded"
vim.opt.lazyredraw = true -- Don't redraw during macros
vim.opt.showmatch = true -- Highlight matching brackets
vim.opt.matchtime = 2 -- How long to show a matching brackets

-- Buffer splitting behaviour
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Scrolloff
vim.opt.scrolloff = 10 -- Keep this many lines above cursor
vim.opt.sidescrolloff = 8 -- Keep this many columns left-right of cursor

-- Opt list
vim.opt.list = true

-- File handling
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true -- Persistent undo
vim.opt.undodir = vim.fn.expand("~/.config/nvim/undo") -- Easy to access undo directory
vim.opt.updatetime = 300 -- Faster completion
--vim.opt.timeoutlen = 0 -- This was the problem with not being able to use the <leader> key
vim.opt.autoread = true
vim.opt.autowrite = false -- Don't auto-save


-- Netrw settings --
-- Netrw is Vim's (and therefore, Neovim's) default file manager
vim.g.netrw_banner = false -- Hide annoying banner
vim.g.netrw_preview = 1
vim.g.netrw_altv = 1
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 4
vim.g.netrw_winsize = 80

-- Sync OS and Nvim keyboard
vim.schedule(function()
    vim.opt.clipboard = "unnamedplus"
end)

-- Keybindings

--local map = vim.keymap.set
local all_modes = { 'n', 'v', 'x' }

-- Shout out (:so)
vim.keymap.set("n", '<leader>o', ':update<CR> :source<CR>')

-- Uppercase letters keybindings (shift keys act as a sort of leader key)
-- Better J behaviour
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

-- Move lines up and down using the Alt key (<A-j> or <A-k> for example)
-- Normal mode
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
-- Visual mode
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Better visual mode indenting 
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- QWE keys
vim.keymap.set("n", "<leader>w", ":write<CR>") -- W for "write"
vim.keymap.set("n", "<leader>q", ":quit<CR>") -- Q for "quit"
--vim.keymap.set("n", "<leader>e", ":Oil<CR>") -- E for "enter file system"

-- File explorer
vim.keymap.set("n", "<leader>e", "<cmd>Ex<cr>")

-- Quick
vim.keymap.set(all_modes, "<leader>y", '"+y<CR>')
vim.keymap.set(all_modes, "<leader>d", '"+d<CR>')
vim.keymap.set(all_modes, "<leader>s", 'e #<CR>')
vim.keymap.set(all_modes, "<leader>S", ':sd #<CR>')


-- Window splitting
vim.keymap.set("n", "<leader>sw", ":vsplit<CR>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Split window horizontally" })

-- Buffer navigation
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous Buffer" })


-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Center screen when jumping
-- They have the same description lmao
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move down one page" })
vim.keymap.set("n", "<C-u>", "<C-u>zz>", { desc = "Move down one page" })
vim.keymap.set("n", "<C-f>", "<C-f>zz", { desc = "Move down one page" })
vim.keymap.set("n", "<C-b>", "<C-b>zz", { desc = "Move down one page" })

vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)"})

-- Quick config editing
vim.keymap.set("n", "<leader>cf", ":e ~/.config/nvim/init.lua<CR>", { desc = "Go to Vim config" })


vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)

-- Netrw
vim.keymap.set("n", "<Tab>", function ()
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        if vim.bo[buf].filetype == "netrw" then
            vim.api.nvim_win_close(win, true)
            return
        end
    end

    -- If not, open netrw in a vertical split
    vim.cmd("leftabove vertical 40vsplit | Ex")
end, { desc = "Toggle Netrw" })

-- Remove highlighted words after search
vim.keymap.set("n", "<Esc>", ":nohlsearch<CR><Esc>", { desc = "Clear Search Highlight" })


-- Mini pick (acts as a sort of Telescope finder)
--vim.keymap.set("n", "<leader>f", ":Pick files<CR>")
--vim.keymap.set("n", "<leader>h", ":Pick help<CR>")
--vim.keymap.set("n", "<leader>g", ":Pick", { desc = "Grep codebase" })
--vim.keymap.set("n", "<leader>/", ":Pick", { desc = "Grep inside Current File" })


-- Vim auto commands
-- Highlight when yanking (makes a flashing effect)
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",

    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

-- Disable automatic comment insertion on newline
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.opt.formatoptions:remove({ "c", "r", "o" })
    end,
})

-- Toggle between relative and absolute line numbers
-- Modified https://github.com/sitiom/nvim-numbertoggle
local augroup = vim.api.nvim_create_augroup("numbertoggle", {})

vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "CmdlineLeave", "WinEnter" }, {
   pattern = "*",
   group = augroup,
   callback = function()
      if vim.o.nu and vim.api.nvim_get_mode().mode ~= "i" then
         vim.opt.relativenumber = true
      end
   end,
})

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "CmdlineEnter", "WinLeave" }, {
   pattern = "*",
   group = augroup,
   callback = function()
      if vim.o.nu then
         vim.opt.relativenumber = false
         -- Conditional taken from https://github.com/rockyzhang24/dotfiles/commit/03dd14b5d43f812661b88c4660c03d714132abcf
         -- Workaround for https://github.com/neovim/neovim/issues/32068
         if not vim.tbl_contains({"@", "-"}, vim.v.event.cmdtype) then
            vim.cmd "redraw"
         end
      end
   end,
})



--require "mini.pick".setup()

--require "oil".setup()
require "mason".setup()
require "nvim-treesitter".setup({
    ensure_installed = { "lua_ls", "clangd" },
    highlight = { enable = true }, -- Syntax highlighting
})
--require "vague".setup({ transparent = true })


local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
lspconfig.lua_ls.setup({ capabilities = capabilities })
lspconfig.clangd.setup({
    capabilities = capabilities,
    cmd = { "clangd", "--background-index", "--compile-commands-dir=." },
})


local cmp = require("cmp")
cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },

    mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<s-Tab>"] = cmp.mapping.select_prev_item(),
    }),
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
    },
})

-- Which key
require "which-key".setup()

-- Buffer line
--require "bufferline".setup()

-- TODO comments
require "todo-comments".setup()
-- Telescope TODO integration
vim.keymap.set("n", "<leader>td", "<cmd>TodoTelescope<cr>")

-- LSP commands
local builtin = require("telescope.builtin")
vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "[G]oto [D]efinition" })
vim.keymap.set("n", "gr", builtin.lsp_references, { desc = "[G]oto [R]eferences" })
vim.keymap.set("n", "gI", builtin.lsp_implementations, { desc = "[G]oto [I]mplementation" })

vim.keymap.set("n", "<leader>D", builtin.lsp_type_definitions, { desc = "Type [D]efinition" })
vim.keymap.set("n", "<leader>ds", builtin.lsp_document_symbols, { desc = "[D]ocument [S]ymbols" })


-- Telescope
vim.keymap.set("n", "<leader>f", "<cmd>Telescope find_files<cr>", { desc = "[F]ind Files" })
vim.keymap.set("n", "<leader>g", "<cmd>Telescope live_grep<cr>", { desc = "Grep Codebase" })
vim.keymap.set("n", "<leader>/", "<cmd>Telescope grep_string<cr>", { desc = "Grep Inside Current File" })


-- harpoon  
require "harpoon".setup()

local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", harpoon_mark.add_file, { desc = "[A]dd File"})
vim.keymap.set("n", "<leader>m", harpoon_ui.toggle_quick_menu, { desc = "Harpoon [M]enu"})
vim.keymap.set("n", "<leader>n", harpoon_ui.nav_next, { desc = "Harpoon [N]ext File"})
vim.keymap.set("n", "<leader>p", harpoon_ui.nav_prev, { desc = "Harpoon [P]revious File"})

-- Quick navigation
vim.keymap.set("n", "<leader>1", function() harpoon_ui.nav_file(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon_ui.nav_file(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon_ui.nav_file(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon_ui.nav_file(4) end)
vim.keymap.set("n", "<leader>5", function() harpoon_ui.nav_file(5) end)
vim.keymap.set("n", "<leader>6", function() harpoon_ui.nav_file(6) end)
vim.keymap.set("n", "<leader>7", function() harpoon_ui.nav_file(7) end)
vim.keymap.set("n", "<leader>8", function() harpoon_ui.nav_file(8) end)
vim.keymap.set("n", "<leader>9", function() harpoon_ui.nav_file(9) end)




-- Speedtyping
vim.keymap.set("n", "<leader>st", "<cmd>Speedtyper<cr>")



-- Color theme

--vim.cmd("colorscheme vague")
--vim.cmd("set background=dark")
--vim.cmd("colorscheme gruvbox")
vim.cmd("colorscheme vaporwave")
vim.cmd(":hi statusline guibg=NONE") -- Removes background
vim.cmd("set completeopt+=noselect")
