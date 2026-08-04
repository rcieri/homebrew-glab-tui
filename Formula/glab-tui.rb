class GlabTui < Formula
  desc "Terminal user interface for GitLab and GitHub"
  homepage "https://github.com/rcieri/glab-tui"
  license "MIT"

  depends_on "gh"
  depends_on "glab" => :recommended

  on_macos do
    on_intel do
      url "https://github.com/rcieri/glab-tui/releases/download/v0.8.3/glab-tui-macos-amd64.tar.gz"
      sha256 "db9c395c9643754e017f97b1198cbe1a55c846f13b647e2b379538c9c7dce631"
    end
    on_arm do
      url "https://github.com/rcieri/glab-tui/releases/download/v0.8.3/glab-tui-macos-arm64.tar.gz"
      sha256 "b937f61b58c90652f8d75a108e181676ebb3486688ec55a0975e9171f3b3c5bf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/rcieri/glab-tui/releases/download/v0.8.3/glab-tui-linux-amd64.tar.gz"
      sha256 "d37219320373aa69bc6c8df350e4bf74e2deafc700043b88eeac572d5d3598f6"
    end
    on_arm do
      url "https://github.com/rcieri/glab-tui/releases/download/v0.8.3/glab-tui-linux-arm64.tar.gz"
      sha256 "7a851fa11dde4278d87dcd7db8eafbcd627ea32a523871bac78900bf5623a192"
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
