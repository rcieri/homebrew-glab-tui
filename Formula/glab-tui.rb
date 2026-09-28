class GlabTui < Formula
  desc "Terminal user interface for GitLab and GitHub"
  homepage "https://github.com/rcieri/glab-tui"
  license "MIT"

  depends_on "gh"
  depends_on "glab" => :recommended

  on_macos do
    on_intel do
      url "https://github.com/rcieri/glab-tui/releases/download/v0.9.2/glab-tui-macos-amd64.tar.gz"
      sha256 "20bc76e5e9efddfb9a590d0d8e54e8b6e62ab5084bd07116172a925a0bbe0036"
    end
    on_arm do
      url "https://github.com/rcieri/glab-tui/releases/download/v0.9.2/glab-tui-macos-arm64.tar.gz"
      sha256 "257182615798912f7f504beea6696d942f11f4b7664e8106fb6a6a9dcbb6969f"
    end
  end

  # Fully static musl builds: run on any Linux distro regardless of glibc
  # version, matching Homebrew's minimum glibc support baseline.
  on_linux do
    on_intel do
      url "https://github.com/rcieri/glab-tui/releases/download/v0.9.2/glab-tui-linux-amd64-musl.tar.gz"
      sha256 "b6df98bb30ddde6e3b305e8e8cac50d4292a53c4eae768643ede19b8e272cd48"
    end
    on_arm do
      url "https://github.com/rcieri/glab-tui/releases/download/v0.9.2/glab-tui-linux-arm64-musl.tar.gz"
      sha256 "83d116cc537a87d4196fbd68d544c143b9f37058d2e44bd2e641d363b559d50e"
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
    system "\#{bin}/glab-tui", "--help"
  end
end
