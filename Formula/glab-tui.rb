class GlabTui < Formula
  desc "Terminal user interface for GitLab and GitHub"
  homepage "https://github.com/rcieri/glab-tui"
  license "MIT"

  depends_on "gh"
  depends_on "glab" => :recommended

  on_macos do
    on_intel do
      url "https://github.com/rcieri/glab-tui/releases/download/v0.7.0/glab-tui-macos-amd64.tar.gz"
      sha256 "9e891689094af40c1f5a48ec536309c4ddc158e37de7c191480419f712f27cdd"
    end
    on_arm do
      url "https://github.com/rcieri/glab-tui/releases/download/v0.7.0/glab-tui-macos-arm64.tar.gz"
      sha256 "f8c19da9fc66ea9690192e1460435baa68647196c3c57151dc5f694a312904fd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/rcieri/glab-tui/releases/download/v0.7.0/glab-tui-linux-amd64.tar.gz"
      sha256 "5c74ca7c15db6707b8f8385622dcd49392c122f823eb3ae17968e8f76e44937d"
    end
    on_arm do
      url "https://github.com/rcieri/glab-tui/releases/download/v0.7.0/glab-tui-linux-arm64.tar.gz"
      sha256 "afe35f3dc74379874b1c730408bd1647dadc9f56ca246264a138580963a2bba1"
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
