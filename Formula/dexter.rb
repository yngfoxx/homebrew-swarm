# Homebrew formula for Dexter — the swarm control-plane TUI client.
#
# Build-from-source: Homebrew compiles it locally with the `go` toolchain, so there is NO code signing /
# notarization to deal with and macOS Gatekeeper never blocks it. `brew` also puts it on the PATH and
# handles upgrades (`brew upgrade dexter`).
#
# PRIVATE-REPO INSTALL (no token needed): swarm is a PRIVATE repo, so this formula is `head`-only — install
# with `brew install --HEAD yngfoxx/swarm/dexter`. `--HEAD` does a plain `git clone`, which uses the Mac
# user's OWN GitHub git credentials (gh auth / SSH / credential helper) — so anyone with access to the
# private repo installs with no extra HOMEBREW_GITHUB_API_TOKEN. Only the client is packaged; the Computer
# (server) is Linux + Docker and runs from source (`make run`).
#
# When swarm becomes public / has tagged releases, add `url`+`sha256` (see ../README.md) for a stable
# `brew install` without --HEAD.
class Dexter < Formula
  desc "TUI client for the swarm autonomous coding-agent control plane"
  homepage "https://github.com/yngfoxx/swarm"
  head "https://github.com/yngfoxx/swarm.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"dexter", ldflags: "-s -w"), "./cmd/dexter"
  end

  test do
    assert_match "Dexter", shell_output("#{bin}/dexter help")
  end
end
