# Homebrew tap — `dexter`

Install the Dexter TUI client on macOS (or Linux) with Homebrew. Both `swarm` (the source) and this tap
are **public**, so install needs **no authentication at all** — no token, no SSH key. Homebrew **builds
from source** with the Go toolchain, so there's also no code signing / notarization / Gatekeeper to fight
(the friction an unsigned `.dmg` couldn't solve). `brew` puts `dexter` on the `PATH`; upgrades are
`brew upgrade --fetch-HEAD dexter`.

> Only the **client** is packaged. The **Computer** (server/engine) is Linux + Docker; run it from source
> with `make run` / `scripts/run-computer.sh`.

## Install

```sh
brew tap yngfoxx/swarm
brew install --HEAD yngfoxx/swarm/dexter
```

The formula is `head`-only (always the latest `main`), so `--HEAD` is required.

## Stable, pinned installs (optional)
To allow a plain `brew install` (no `--HEAD`), tag a release and add a stable download to
`Formula/dexter.rb`:
```sh
git tag v0.1.0 && git push --tags
curl -sL https://github.com/yngfoxx/swarm/archive/refs/tags/v0.1.0.tar.gz | shasum -a 256
```
```ruby
url "https://github.com/yngfoxx/swarm/archive/refs/tags/v0.1.0.tar.gz"
sha256 "<the shasum above>"
```

## This tap is generated from the swarm repo
`Formula/dexter.rb` here is the source of truth in `swarm` at `packaging/homebrew-swarm/`; the tap repo
`yngfoxx/homebrew-swarm` is a copy of this directory. To update, edit it in swarm and re-copy it into the
tap repo.

## Lint the formula (no install needed)
```sh
brew audit --new --formula Formula/dexter.rb
```
