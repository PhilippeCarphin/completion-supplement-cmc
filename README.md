# Completions for CMC commands that don't have them

- `ord_soumet`: Everybody knows what that is.
- `glcurl`: A thing that I made for making requests to gitlab.  You should
  probably just use `glab`.
- `voir`: It just adds the `-iment` when you press TAB
- `hcron`: Completes subcommands and arguments to subcommands.  Mainly useful
  to give possible subcommands but also to get the right syntax for `EVENT`
  in `hcron activate EVENT`.
- `clone_suite`:  A tool from CMDI.
- `sqm`: A quota management tool.

## Install

Bash completion does lazy loading (see my [bash-completion-notes](https://github.com/PhilippeCarphin/manpage-supplement/blob/main/share/man/man7/bash-completion-notes.org): when we trigger completion for a command
`my-cmd` that doesn't have a completion spec, bash completion looks for a
file named `_my-cmd`, `my-cmd`, `_my-cmd.bash`, or `my-cmd.bash` in
- `$d/bash-completion/completions` for all the `$d` in `XDG_DATA_DIRS`
- `$HOME/.local/share/bash-completion/completions` (unless `XDG_DATA_HOME` is set
  in which case it looks in `$XDG_DATA_HOME/bash-completion/completions`)
- `${d%%/bin}/share/bash-completion/completions` for all `$d` in `PATH` that end
  with `/bin` (this is only in bash-completion 2.12+).

Knowing this, we can make the completion files in this repo available to the
lazy loading system by doing one of the following:
- Add `${this_repo}/share` to `XDG_DATA_DIRS`
- Do `make PREFIX=${pfx} install` with
  - `pfx=$HOME/.local`
  - `pfx=<some-other-dir>` and add `${pfx}/share` to `XDG_DATA_DIRS`.

### Fool proof way

We can also just source all the files at shell startup by adding something
like this in BASH's startup files:
```bash
for f in <THIS-DIR>/share/bash-completion/completions/* ; do
    source $f
done
```
