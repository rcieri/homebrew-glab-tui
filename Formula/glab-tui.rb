class GlabTui < Formula
  desc "Terminal user interface for GitLab and GitHub"
  homepage "https://github.com/rcieri/glab-tui"
  license "MIT"

  depends_on "gh"
  depends_on "glab" => :recommended

  on_macos do
    on_intel do
      url "https://github.com/rcieri/glab-tui/releases/download/v0.6.0/glab-tui-macos-amd64.tar.gz"
      sha256 "7afbc882fcebef9008d518ec875eeffb22a759043ac131e6f36bfbcb3f3d849b"
    end
    on_arm do
      url "https://github.com/rcieri/glab-tui/releases/download/v0.6.0/glab-tui-macos-arm64.tar.gz"
      sha256 "fc7b03260d12ed941efc791bceba9d8fae77ce589fe8e99d00157bdbf533955f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/rcieri/glab-tui/releases/download/v0.6.0/glab-tui-linux-amd64.tar.gz"
      sha256 "c3011b2728808964e960f236d5156861454e9d6002a1ed558dd5386607013a1a"
    end
    on_arm do
      url "https://github.com/rcieri/glab-tui/releases/download/v0.6.0/glab-tui-linux-arm64.tar.gz"
      sha256 "b2a5025f5cae22eea8c6b0792e48285caed1e42b9d1a0e029c3e557ba9fe7672"
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
