# Homebrew formula for Dexter — the swarm control-plane TUI client.
#
# Build-from-source: Homebrew compiles it locally with the `go` toolchain, so there is NO code signing /
# notarization to deal with and macOS Gatekeeper never blocks it. `brew` also puts it on the PATH and
# handles upgrades (`brew upgrade dexter`).
#
# swarm is PUBLIC, so this installs with NO authentication at all: `--HEAD` git-clones the public repo and
# builds dexter — no token, no SSH key, no Gatekeeper. Install with:
#     brew install --HEAD yngfoxx/swarm/dexter
# It is `head`-only (always the latest `main`); for a stable, pinned `brew install` WITHOUT --HEAD, add a
# tagged release's `url` + `sha256` (see ../README.md). Only the client is packaged; the Computer (server)
# is Linux + Docker and runs from source (`make run`).
class Dexter < Formula
  desc "TUI client for the swarm autonomous coding-agent control plane"
  homepage "https://github.com/yngfoxx/swarm"
  license "Apache-2.0"
  head "https://github.com/yngfoxx/swarm.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"dexter", ldflags: "-s -w"), "./cmd/dexter"
  end

  test do
    assert_match "Dexter", shell_output("#{bin}/dexter help")
  end
end
