class GlabTui < Formula
  desc "Terminal user interface for GitLab and GitHub"
  homepage "https://github.com/rcieri/glab-tui"
  license "MIT"

  depends_on "gh"
  depends_on "glab" => :recommended

  on_macos do
    on_intel do
      url "https://github.com/rcieri/glab-tui/releases/download/v0.9.3/glab-tui-macos-amd64.tar.gz"
      sha256 "cd39a25c26b1b458a6f7d7a8594ee8ade0fe0d8c8d8bfdd7b22a3e1fa19618eb"
    end
    on_arm do
      url "https://github.com/rcieri/glab-tui/releases/download/v0.9.3/glab-tui-macos-arm64.tar.gz"
      sha256 "5fe8766f65de0112c1b61c644c8ddf53c0d48f1d64aa8c3239a114cd53e0dbbc"
    end
  end

  # Fully static musl builds: run on any Linux distro regardless of glibc
  # version, matching Homebrew's minimum glibc support baseline.
  on_linux do
    on_intel do
      url "https://github.com/rcieri/glab-tui/releases/download/v0.9.3/glab-tui-linux-amd64-musl.tar.gz"
      sha256 "138447b77c515163ddcf72aeedbbc5aed2903d78f9ae1b80e56d8232967f688a"
    end
    on_arm do
      url "https://github.com/rcieri/glab-tui/releases/download/v0.9.3/glab-tui-linux-arm64-musl.tar.gz"
      sha256 "6456e9007d241d2197e862b9e90e12ca7ab76f7a884d281aac063156bb028d69"
    end
  end

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    bin.install "glab-tui"
  end

  test do
    system "#{bin}/glab-tui", "--help"
  end
end
