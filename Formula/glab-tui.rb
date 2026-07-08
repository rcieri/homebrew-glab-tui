class GlabTui < Formula
  desc "Terminal user interface for GitLab and GitHub"
  homepage "https://github.com/rcieri/glab-tui"
  license "MIT"

  depends_on "gh"
  depends_on "glab" => :recommended

  on_macos do
    on_intel do
      url "https://github.com/rcieri/glab-tui/releases/download/v0.5.0/glab-tui-macos-amd64.tar.gz"
      sha256 "6130cb9b72aef71549b1a7d310baa1520301027ee3cc03156dae31819ef5c3ac"
    end
    on_arm do
      url "https://github.com/rcieri/glab-tui/releases/download/v0.5.0/glab-tui-macos-arm64.tar.gz"
      sha256 "8b3b89affee6313c66fec5ad5096b7d81450ccb17c5d49c032bc1df6a52819c5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/rcieri/glab-tui/releases/download/v0.5.0/glab-tui-linux-amd64.tar.gz"
      sha256 "d5d1f473e31a8aff6b3219adba84a2dd37c860c14db6634dbba8c7de1c93c944"
    end
    on_arm do
      url "https://github.com/rcieri/glab-tui/releases/download/v0.5.0/glab-tui-linux-arm64.tar.gz"
      sha256 "c26ac71ec46fda4d28e9e54a41b892715a57b69dd5a720ad6ebab8f266aac154"
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
