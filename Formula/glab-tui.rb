class GlabTui < Formula
  desc "Terminal user interface for GitLab and GitHub"
  homepage "https://github.com/rcieri/glab-tui"
  license "MIT"

  depends_on "gh"
  depends_on "glab" => :recommended

  on_macos do
    on_intel do
      url "https://github.com/rcieri/glab-tui/releases/download/v0.6.0/glab-tui-macos-amd64.tar.gz"
      sha256 "8f0dd9f7f8d8e0e213ae7f6c896fe7fdb33b4926b80a6244da1354d6af4c67e1"
    end
    on_arm do
      url "https://github.com/rcieri/glab-tui/releases/download/v0.6.0/glab-tui-macos-arm64.tar.gz"
      sha256 "9f5b097b025e8634228fd574f4dae49e49716cc8f939aead06e388971808e3c0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/rcieri/glab-tui/releases/download/v0.6.0/glab-tui-linux-amd64.tar.gz"
      sha256 "48134b060024885096e4f68922814131fa3ecad62d568767d77719fe72d63f75"
    end
    on_arm do
      url "https://github.com/rcieri/glab-tui/releases/download/v0.6.0/glab-tui-linux-arm64.tar.gz"
      sha256 "ff15a16670b82325992357ea7574c19993db13bda55ed56bdbdf284643d3849f"
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
