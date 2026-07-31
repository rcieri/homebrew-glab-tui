class GlabTui < Formula
  desc "Terminal user interface for GitLab and GitHub"
  homepage "https://github.com/rcieri/glab-tui"
  license "MIT"

  depends_on "gh"
  depends_on "glab" => :recommended

  on_macos do
    on_intel do
      url "https://github.com/rcieri/glab-tui/releases/download/v0.8.1/glab-tui-macos-amd64.tar.gz"
      sha256 "ff105e4b9929f5cf8d4ba47f215503233e75ce1b599d7f8524c1c8cbf71a3f78"
    end
    on_arm do
      url "https://github.com/rcieri/glab-tui/releases/download/v0.8.1/glab-tui-macos-arm64.tar.gz"
      sha256 "ecc03ccafb122b37027421b6df5e36848746edb24d89acd2a1d99932262b1c66"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/rcieri/glab-tui/releases/download/v0.8.1/glab-tui-linux-amd64.tar.gz"
      sha256 "192d12bb805c7be10de9be24ddc5d401bad5b2fd0c7bb5b9d6e0ea6efe5c9825"
    end
    on_arm do
      url "https://github.com/rcieri/glab-tui/releases/download/v0.8.1/glab-tui-linux-arm64.tar.gz"
      sha256 "e6d96ff38676122cfe9d49fe1b9aa9f9c69a625f59ec27f157c1445aa5051b44"
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
