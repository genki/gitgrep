# gitgrep

`gitgrep` is a fork of ripgrep that changes the command name to `gg` and adds
Git-aware timestamps to standard search output.

When a searched file is inside a Git repository, each matching line is prefixed
with the line's last edit time as a UNIX timestamp derived from
`git blame --line-porcelain`. The blame data is resolved once per file and
cached, so lookup during match printing is constant time.

## Example

```text
$ gg updated .
1706843045:./tracked.txt:beta updated
```

## Behavior

- `gg` keeps ripgrep's default recursive search behavior, ignore-file support,
  and fast search engine.
- Git timestamps are added only for standard match output on regular files in a
  Git repository.
- Searches over `stdin`, preprocessed input, decompressed streams, JSON output,
  and summary modes keep their existing behavior.

## Install

Build locally:

```bash
cargo build
./target/debug/gg --help
```

Install into the current environment:

```bash
cargo install --path . --force
gg --version
```

## License

This fork is distributed under the [Unlicense](UNLICENSE).

## Upstream

This project is based on [BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep).
