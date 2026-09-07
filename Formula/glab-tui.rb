class GlabTui < Formula
  desc "Terminal user interface for GitLab and GitHub"
  homepage "https://github.com/rcieri/glab-tui"
  license "MIT"

  depends_on "gh"
  depends_on "glab" => :recommended

  on_macos do
    on_intel do
      url "https://github.com/rcieri/glab-tui/releases/download/v0.9.1/glab-tui-macos-amd64.tar.gz"
      sha256 "cb709db2cc2961b454a4b1939d83412e4d586d7d32956f4de78e91f20ff0ab48"
    end
    on_arm do
      url "https://github.com/rcieri/glab-tui/releases/download/v0.9.1/glab-tui-macos-arm64.tar.gz"
      sha256 "8997a3261cc6717ecf9c9f590c7548fc75e12266c008972fbe2209109c4dd6f2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/rcieri/glab-tui/releases/download/v0.9.1/glab-tui-linux-amd64-musl.tar.gz"
      sha256 "4ea6ecbdcc4310e63539e8e75277866b1697ceefddd72cea2da5b47d26a97ef1"
    end
    on_arm do
      url "https://github.com/rcieri/glab-tui/releases/download/v0.9.1/glab-tui-linux-arm64-musl.tar.gz"
      sha256 "1fa74116616fd30d104436ec126de16379b2371ffb815cfa5be85ea6391f68d3"
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
