# Homebrew tap — `dexter` (private-repo install, no token)

Install the Dexter TUI client on macOS (or Linux) with Homebrew. Homebrew **builds from source** with
the Go toolchain, so there's **no code signing / notarization / Gatekeeper** to fight — the exact thing a
`.dmg` of an unsigned binary couldn't solve. `brew` puts `dexter` on the `PATH` and `brew upgrade dexter`
keeps it current.

> Only the **client** is packaged. The **Computer** (server/engine) is Linux + Docker; run it from source
> with `make run` / `scripts/run-computer.sh`.

## Install (for anyone with access to the private `yngfoxx/swarm` repo)

```sh
brew tap yngfoxx/swarm
brew install --HEAD yngfoxx/swarm/dexter
```

- `swarm` is **private**, so the formula is `head`-only: `--HEAD` does a plain `git clone`, which uses your
  **own** GitHub git credentials (`gh auth login`, SSH, or a credential helper). No
  `HOMEBREW_GITHUB_API_TOKEN` needed — if you can clone the repo, you can install.
- The tap repo (`yngfoxx/homebrew-swarm`) is also private; `brew tap` clones it with the same git auth.

Update to the latest `main`: `brew upgrade --fetch-HEAD dexter`.

## This tap is generated from the swarm repo
`Formula/dexter.rb` here is the source of truth in `swarm` at `packaging/homebrew-swarm/`. The tap repo
`yngfoxx/homebrew-swarm` is a copy of this directory. To update the formula, edit it in swarm and re-copy
(or `git subtree`/CI) it into the tap repo.

## If swarm ever goes public / gets tagged releases
Add a stable download to `Formula/dexter.rb` so plain `brew install` (no `--HEAD`) works:
```ruby
url "https://github.com/yngfoxx/swarm/archive/refs/tags/v0.1.0.tar.gz"
sha256 "…"   # curl -sL <url> | shasum -a 256
```
