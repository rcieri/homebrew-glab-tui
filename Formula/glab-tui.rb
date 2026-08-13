class GlabTui < Formula
  desc "Terminal user interface for GitLab and GitHub"
  homepage "https://github.com/rcieri/glab-tui"
  license "MIT"

  depends_on "gh"
  depends_on "glab" => :recommended

  on_macos do
    on_intel do
      url "https://github.com/rcieri/glab-tui/releases/download/v0.8.4/glab-tui-macos-amd64.tar.gz"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
    end
    on_arm do
      url "https://github.com/rcieri/glab-tui/releases/download/v0.8.4/glab-tui-macos-arm64.tar.gz"
      sha256 "e3421f99ab3bfa75944641e19db73243958079d5cb9515a833f58d1a7fbc55f6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/rcieri/glab-tui/releases/download/v0.8.4/glab-tui-linux-amd64.tar.gz"
      sha256 "aab65d481b333e230f574a9b66b2a78162088296074beeff25395139a9ccab59"
    end
    on_arm do
      url "https://github.com/rcieri/glab-tui/releases/download/v0.8.4/glab-tui-linux-arm64.tar.gz"
      sha256 "451ce6a5e7b6cfb28dce59b2da1c9ee4fba1e604d2638e21ee99841c47e06c86"
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
