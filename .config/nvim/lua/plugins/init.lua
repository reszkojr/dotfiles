return {
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("config.lualine")
        end,
    },
    { "ellisonleao/gruvbox.nvim", priority = 1000, config = true },

    {
        "nvim-java/nvim-java",
        build = function()
            require('config.nvim-java')
        end
    },

    { "neovim/nvim-lspconfig" },
    { "onsails/lspkind.nvim" },

    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        opts = {
            registries = {
                'github:nvim-java/mason-registry',
                'github:mason-org/mason-registry',
            },
        },
    },

    { "rcarriga/nvim-notify" },

    {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    },

    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

    { "hrsh7th/cmp-nvim-lsp" },
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("config.indent-blankline")
        end,
    },

    { "tmsvg/pear-tree" },
    { "honza/vim-snippets" },

    { "github/copilot.vim" },

    {
        "SmiteshP/nvim-navic",
        dependencies = "neovim/nvim-lspconfig",
    },

    {
        "puremourning/vimspector",
        lazy = false,
        build = function()
            vim.cmd([[packadd! vimspector]])
        end,
    },

    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },

    {
        "hrsh7th/nvim-cmp",
        event = { "InsertEnter", "CmdlineEnter" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "saadparwaiz1/cmp_luasnip",
            "L3MON4D3/LuaSnip",
            "onsails/lspkind.nvim",
        },
        config = function()
            require("config.cmp")
        end,
    },
    {
        'L3MON4D3/LuaSnip',
        dependencies = { 'saadparwaiz1/cmp_luasnip' },
        config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
            require('luasnip.loaders.from_snipmate').lazy_load()
        end,
    },
    { "psliwka/vim-smoothie" },
    {
        "dense-analysis/ale",
        enabled = false,
        ft = { "python", "lua" },
        init = function()
            vim.g.ale_fix_on_save = 0
            vim.g.ale_linters_explicit = 1
        end,
    },
    {
        "stevearc/conform.nvim",
        opts = {},
        config = function()
            require("config.conform")
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("config.gitsigns")
        end,
    },
    {
        "echasnovski/mini.surround",
        config = function()
            require("config.mini-surround")
        end,
    },
    {
        "wfxr/minimap.vim",
        enabled = false,
        build = "cargo install --locked code-minimap",
        config = function()
            require("config.minimap")
        end,
        ft = { "python", "lua", "javascript", "typescript", "html", "css", "markdown" },
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-fzf-native.nvim",
            "nvim-telescope/telescope-file-browser.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
        },
        config = function()
            require("config.telescope")
        end,
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
            require("telescope").load_extension("fzf")
        end,
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").load_extension("file_browser")

            vim.keymap.set("n", "<leader>fe", ":Telescope file_browser<CR>", { desc = "File browser (Telescope)" })
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").load_extension("ui-select")
        end,
    },
    {
        "romgrk/barbar.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "lewis6991/gitsigns.nvim",
        },
        init = function()
            vim.g.barbar_auto_setup = false
        end,
        config = function()
            require("config.barbar")
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("config.nvim-tree")
        end,
    },
    {
        "kevinhwang91/nvim-ufo",
        enabled = false,
        dependencies = {
            "kevinhwang91/promise-async",
        },
    },
    {
        "Jezda1337/nvim-html-css",
        dependencies = { "hrsh7th/nvim-cmp", "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("config.html")
        end
    },
    {
        "luckasRanarison/tailwind-tools.nvim",
        name = "tailwind-tools",
        build = ":UpdateRemotePlugins",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-telescope/telescope.nvim",
            "neovim/nvim-lspconfig",
        },
        opts = {},
        config = function()
            require("config.tailwind-tools")
        end
    },
    {
        "mattn/emmet-vim",
        ft = { "html", "css", "javascriptreact", "typescriptreact" },
        init = function()
            require("config.emmet")
        end,
    },
    {
        'norcalli/nvim-colorizer.lua',
        init = function()
            require("config.colorizer")
        end
    }

}
