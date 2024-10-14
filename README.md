<h1 align="center" style="background: linear-gradient(45deg, #F8BD96, #F28FAD); background-clip: text; color: transparent;">Assistant.nvim</h1>

<div align="center"><p>
    <a href="https://github.com/A7Lavinraj/assistant.nvim/releases/latest">
      <img alt="Latest release" src="https://img.shields.io/github/v/release/A7Lavinraj/assistant.nvim?style=for-the-badge&logo=starship&color=C9CBFF&logoColor=D9E0EE&labelColor=302D41&include_prerelease&sort=semver" />
    </a>
    <a href="https://github.com/A7Lavinraj/assistant.nvim/pulse">
      <img alt="Last commit" src="https://img.shields.io/github/last-commit/A7Lavinraj/assistant.nvim?style=for-the-badge&logo=starship&color=8bd5ca&logoColor=D9E0EE&labelColor=302D41"/>
    </a>
    <a href="https://github.com/A7Lavinraj/assistant.nvim/blob/main/LICENSE">
      <img alt="License" src="https://img.shields.io/github/license/A7Lavinraj/assistant.nvim?style=for-the-badge&logo=starship&color=ee999f&logoColor=D9E0EE&labelColor=302D41" />
    </a>
    <a href="https://github.com/A7Lavinraj/assistant.nvim/stargazers">
      <img alt="Stars" src="https://img.shields.io/github/stars/A7Lavinraj/assistant.nvim?style=for-the-badge&logo=starship&color=c69ff5&logoColor=D9E0EE&labelColor=302D41" />
    </a>
    <a href="https://github.com/A7Lavinraj/assistant.nvim/issues">
      <img alt="Issues" src="https://img.shields.io/github/issues/A7Lavinraj/assistant.nvim?style=for-the-badge&logo=bilibili&color=F5E0DC&logoColor=D9E0EE&labelColor=302D41" />
    </a>
    <a href="https://github.com/A7Lavinraj/assistant.nvim">
      <img alt="Repo Size" src="https://img.shields.io/github/repo-size/A7Lavinraj/assistant.nvim?color=%23DDB6F2&label=SIZE&logo=codesandbox&style=for-the-badge&logoColor=D9E0EE&labelColor=302D41" />
    </a>
</div>

<h4 align="center"><span>Assistant.nvim</span> is a neovim plugin which provide various features related to sample data testing in competitive programming scenarios</h4>

<br />

![DEMO](./assets/demo.png)

<br />

# **Features**

- :zap: Blazingly fast.
- :unlock: Highly customizable.
- :high_brightness: Supports both environment and custom themes.
- :smiley: Easy to use.

<br />

>One important factor in competitive programming is Speed, make sure you don't compromise with that, while using some fancy plugin or software.

<br />

# **Requirements**

- **Neovim version** >= 9.5
- [Competitive companion Browser extension](https://github.com/jmerle/competitive-companion)

<br />

# **Setup with [Lazy.nvim](https://github.com/folke/lazy.nvim)**

```lua
-- Example to setup for C++ and Python
{
    "A7lavinraj/assistant.nvim",
    dependencies = { "stevearc/dressing.nvim" }, -- optional but recommended
    opts = { -- you can also pass opts as {}, cpp and python are supported by default
        commands = {
            python = {
                extension = "py",
                compile = nil,
                execute = {
                    main = "python3",
                    args = { "$FILENAME_WITH_EXTENSION" }
                },
            },
            cpp = {
                extension = "cpp",
                compile = {
                    main = "g++",
                    args = { "$FILENAME_WITH_EXTENSION", "-o", "$FILENAME_WITHOUT_EXTENSION" }
                },
                execute = {
                    main = "./$FILENAME_WITHOUT_EXTENSION",
                    args = nil
                },
            },
        },
        time_limit = 5000,
        border = false, -- border is OFF by default, you can can pass true to enable borders
        theme = "dynamic" -- "gruvbox", "catppuccin" and "tokyonight" are also available
    }
}
```

## Explaination of above code snippet

- First line points to github repository from where the plugin is get installed.
- Second line is the dependency array for the plugin, In this case its [Dressing.nvim](https://github.com/stevearc/dressing.nvim)
- Third line contains the options table to customize plugin:

```sh
g++ example.cpp -o example # {main} {arg1} {args2} {arg3}
```

Above code snippet is a command to compile a C++ file, If you take a closure look on the comment right infront of command you can guess `main = g++`, `arg1 = example.cpp`, `arg2 = -o` and `arg3 = example`, So if i want to extend the configuration for `Python`, I just need to add following code snippet to commands table.

```lua
python = {
    extension = "py", -- your prefered file extension for python file
    compile = nil, -- since python code doesn't get compiled so pass a nil
    execute = { -- {main} command and array of {args} as we saw earlier.
        main = "python3",
        args = { "$FILENAME_WITH_EXTENSION" }
    },
},
```

<br />

>key to the new table is **type of file you want to run**. In this case is `python`, you can get the correct filetype of file by just open that file inside neovim and type the following command.

<br />

```lua
:lua print(vim.bo.filetype)
```

- `time_limit` option is used to limit your code execution process to prevent infinite execution.
- `border` option is used to enable borders.
- `theme` option is used to change themes. there are only four options yet `gruvbox`, `catppuccin`, `tokyonight` and `dynamic`. `dynamic` option uses the current environment colorsheme.

<br />

https://github.com/user-attachments/assets/cf62cd9e-8b23-48be-86f5-c5ae24915b63

<br />

In the above video guide you can see every feature that this plugin provides.

- :page_facing_up: Sample fetching
- :rocket: Running testcases
- :memo: Adding custom testcases

<br />

>There is only one command to interact with plugin <span style="font-weight: bold; color: lightgray;">AssistantToggle</span> which toggle the UI window of plugin and rest operations are done by keymappings.

<br />

```lua
 -- command to open and close plugin window
:AssistantToggle

-- prefered keymap for conciseness
vim.keymap.set("n", "<leader>a", "<cmd>AssistantToggle<cr>", { desc = "Assistant window toggle" })
```

<br />

| Key   | Operation                                       |
| ----- | ----------------------------------------------- |
| `Tab` | Move between splits                             |
| `Esc` | Close current window                            |
| `q`   | Close current window                            |
| `r`   | Run testcase on which the cursor is holded      |
| `R`   | Run all available testcases                     |
| `c`   | Create an empty testcase                        |
| `d`   | Delete testcase on which the cursor is holded   |
| `i`   | Open prompt window for updating input           |
| `e`   | Open prompt window for updating expected output |
| `n`   | Move to next available testcase                 |
| `p`   | Move to previous available testcase             |
