class GlabTui < Formula
  desc "Terminal user interface for GitLab and GitHub"
  homepage "https://github.com/rcieri/glab-tui"
  license "MIT"

  depends_on "gh"
  depends_on "glab" => :recommended

  on_macos do
    on_intel do
      url "https://github.com/rcieri/glab-tui/releases/download/v0.8.0/glab-tui-macos-amd64.tar.gz"
      sha256 "cff32a6a0eb3b067d90c960a260b561f514baef6b1121c89e15bb6e1286c9e46"
    end
    on_arm do
      url "https://github.com/rcieri/glab-tui/releases/download/v0.8.0/glab-tui-macos-arm64.tar.gz"
      sha256 "3d80300581a91949cb9da8310cef3980c85cd7658859709db5ffbbf56451d9ad"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/rcieri/glab-tui/releases/download/v0.8.0/glab-tui-linux-amd64.tar.gz"
      sha256 "73f4acfa8079c7ebadfa57be4c6fdf54c1af7eaaf239c285e6ea63c935a556f9"
    end
    on_arm do
      url "https://github.com/rcieri/glab-tui/releases/download/v0.8.0/glab-tui-linux-arm64.tar.gz"
      sha256 "cfb36ced44fcb3f91130707d0b55d60d4970913c82be8958bc2f091ea159f7c4"
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
