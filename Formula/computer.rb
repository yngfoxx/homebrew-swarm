# Homebrew formula for the swarm Computer — the control-plane server/engine.
#
# Build-from-source (cgo-free), like the client. swarm is PUBLIC, so install needs NO authentication:
#     brew install --HEAD yngfoxx/swarm/computer
# It is `head`-only (always the latest `main`); for a stable, pinned `brew install` WITHOUT --HEAD, add a
# tagged release's `url` + `sha256` (see ../README.md).
#
# RUNTIME: the Computer drives containerized workers, so it needs Docker (Docker Desktop on macOS) plus
# `git` and `gh` on PATH; real runs also want a `graphify` binary and a workspace .env. `computer doctor`
# runs the full prerequisite check.
class Computer < Formula
  desc "Control-plane server for the swarm autonomous coding-agent system"
  homepage "https://github.com/yngfoxx/swarm"
  head "https://github.com/yngfoxx/swarm.git", branch: "main"

  depends_on "go" => :build
  depends_on "git"

  def install
    system "go", "build", *std_go_args(output: bin/"computer", ldflags: "-s -w"), "./cmd/computer"
  end

  def caveats
    <<~EOS
      `computer` is the swarm control plane. At runtime it needs Docker (Docker Desktop on macOS) plus
      `git` and `gh` on PATH; real runs also want a `graphify` binary and a workspace .env. Check the
      prerequisites with `computer doctor`, and see scripts/run-computer.sh in the repo for a launcher.
    EOS
  end

  test do
    assert_match "-addr", shell_output("#{bin}/computer -h 2>&1")
  end
end
