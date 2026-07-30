# orca.vim

Vim plugin for [ORCA quantum chemistry](https://orcaforum.kofo.mpg.de/app.php/portal) input files. Supports ORCA 6.1.1 (backwards compatible with 5.0.2).

---

## Features

### Syntax highlighting

- **`!` keyword line** — methods, functionals, basis sets, convergence keywords
- **Model-specific solvent forms** — `CPCM(...)`, `SMD(...)`, `ALPB(...)`, `DDCOSMO(...)`, `CPCMX(...)`
- **`%block ... end`** — block headers, parameter names, values, strings, numbers
- **`* xyzfile`** — geometry coordinate block
- **Comments** (`#`) — highlighted in dim colour, suppressed from completion
- Inline directives: `%moinp`, `%maxcore`, `%moread`
- **Compound scripts** (`.cmp`) — filetype detection plus highlighting and
  completion for the ORCA 6.1 Compound command set, literals, operators, and
  scalar or indexed `&{…}` expansions
- Inline Compound blocks — Compound syntax, completion, and nested control-flow
  indentation in `%compound … End`/`EndRun`; normal ORCA input remains
  highlighted inside `New_Step … Step_End`

### Autocompletion

Context-aware popup completions trigger automatically as you type:

| Context | Triggers on | Completes |
|---|---|---|
| `!` keyword line | any word character | methods, functionals, basis sets |
| `%` | `%` character or word after it | block names |
| Inside `%block ... end` | any word character | block-specific parameters |
| `* xyzfile 0 1 ` | space after charge/mult | `.xyz` files in buffer directory |
| `%moinp ` | space after directive | auto-inserts `""`, completes `.gbw` files inside |
| `%compound ` | space after directive | auto-inserts `""`, completes `.cmp` files inside |
| Inside a `.cmp` file | any word character | Compound language keywords |

**Tab** accepts the highlighted item and closes the popup. **Shift-Tab** navigates backwards.

When a block name is accepted, a skeleton is inserted automatically:

```
%scf
    |
end
```

### Indentation

- 4-space indent inside `%block ... end` sections
- No indent after inline directives (`%moinp`, `%maxcore`, `%moread`)
- `end` dedents automatically

---

## Installation

Copy the files into your Vim runtime directory:

```
syntax/orca.vim   → ~/.vim/syntax/orca.vim
ftplugin/orca.vim → ~/.vim/ftplugin/orca.vim
ftdetect/orca.vim → ~/.vim/ftdetect/orca.vim
indent/orca.vim   → ~/.vim/indent/orca.vim
```


One-line execution to do this easily in bash: `for d in syntax ftplugin ftdetect indent; do mkdir -p "$HOME/.vim/$d" && cp "$d/orca.vim" "$HOME/.vim/$d/orca.vim"; done`

### Filetype detection

The plugin detects `.inp` and `.cmp` files automatically. If needed, add to your `vimrc`:

```vim
au BufRead,BufNewFile *.inp  set filetype=orca
au BufRead,BufNewFile *.cmp  set filetype=orca
```

For Neovim:

```lua
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = {"*.inp", "*.cmp"},
  command = "set filetype=orca"
})
```

---

## Customisation

Highlight groups follow your colorscheme automatically. To override specific colours, add to your `vimrc`:

```vim
autocmd FileType orca highlight orcaComment ctermfg=8 guifg=#6c7086
```

Key highlight groups: `orcaComment`, `orcaBlock`, `orcaBlockParam`, `orcaKeyword`, `orcaBasis`.

Solvent keyword availability is embedded in `syntax/orca.vim`, derived from the ORCA 6.1 manual
Tables 2.56 and 3.24. Completion reads those syntax rules so the plugin works without external data files.

---

## Similar projects

- [mrymtsk/orca-vim](https://github.com/mrymtsk/orca-vim) by Toshiki Murayama

## License

Apache License 2.0 — see [LICENSE](LICENSE).
