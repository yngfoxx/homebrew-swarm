# Homebrew tap — `swarm` (`dexter` + `computer`)

Install the swarm binaries on macOS (or Linux) with Homebrew — `dexter` (the TUI client) and `computer`
(the control-plane server). Both `swarm` (the source) and this tap are **public**, so install needs **no
authentication at all** — no token, no SSH key. Homebrew **builds from source** (both are cgo-free) with
the Go toolchain, so there's also no code signing / notarization / Gatekeeper to fight (the friction an
unsigned `.dmg` couldn't solve). `brew` puts them on the `PATH`; upgrades are `brew upgrade --fetch-HEAD`.

> `dexter` is cross-platform and runs anywhere. `computer` builds anywhere but at RUNTIME needs Docker
> (Docker Desktop on macOS) to drive its containerized workers; `scripts/run-computer.sh` is a launcher.

## Install

```sh
brew tap yngfoxx/swarm
brew install --HEAD yngfoxx/swarm/dexter      # the TUI client (macOS / Linux) — run this day-to-day
brew install --HEAD yngfoxx/swarm/computer    # the control-plane server/engine
```

Both formulas are `head`-only (always the latest `main`), so `--HEAD` is required. `dexter` is the client;
`computer` is the server — it builds anywhere but at RUNTIME needs Docker (Docker Desktop on macOS) plus
`git`/`gh` on PATH (`computer doctor` checks prerequisites). Most people only need `dexter`.

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
