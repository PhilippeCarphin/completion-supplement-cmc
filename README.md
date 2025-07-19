# Completions for CMC commands that don't have them

## Install

### Fool proof way

In your profile, just source every file in `share/bash-completion/completions/*`
with something like
```bash
for f in <THIS-DIR>/share/bash-completion/completions/* ; do
    source $f
done
```

### Proper way

The proper way takes advantage of bash-completion's lazy-loading mechanism
where the first time completion is requested for a command, it will look in
various places for a file named `_<the command name>`.

For this to work we can

- Add =${repo}/share= to `XDG_DATA_DIRS` environment variable

or

- Run `PREFIX=$HOME/.local make install` to copy the files in
  `$HOME/.local/share/bash-completion/completions`.

or

- Run `PREFIX=<X> make install` with `<X>/share` being part of `XDG_DATA_DIRS`.


See
[bash-completion-notes](https://github.com/PhilippeCarphin/manpage-supplement/blob/main/share/man/man7/bash-completion-notes.org)

