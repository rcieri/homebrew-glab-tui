class GlabTui < Formula
  desc "Terminal user interface for GitLab and GitHub"
  homepage "https://github.com/rcieri/glab-tui"
  license "MIT"

  depends_on "gh"
  depends_on "glab" => :recommended

  on_macos do
    on_intel do
      url "https://github.com/rcieri/glab-tui/releases/download/v0.9.0/glab-tui-macos-amd64.tar.gz"
      sha256 "ad523a10e028296e680c6873a8617ed00f7da3a3d8b0529ad708feea9363d0bf"
    end
    on_arm do
      url "https://github.com/rcieri/glab-tui/releases/download/v0.9.0/glab-tui-macos-arm64.tar.gz"
      sha256 "e94f22073b030ab86c443bdf53b0670c4e550018f5e80a08ca63aea74037a9a0"
    end
  end

  # Fully static musl builds: run on any Linux distro regardless of glibc
  # version, matching Homebrew's minimum glibc support baseline.
  on_linux do
    on_intel do
      url "https://github.com/rcieri/glab-tui/releases/download/v0.9.0/glab-tui-linux-amd64-musl.tar.gz"
      sha256 "90a5f4af647bc6562390c016ae8fca211f8f2eeacd8614dbe15590b2cd93e73d"
    end
    on_arm do
      url "https://github.com/rcieri/glab-tui/releases/download/v0.9.0/glab-tui-linux-arm64-musl.tar.gz"
      sha256 "e90f64a3c8f29d52ffada02363e168c341a0f8e39182cee111070f0efaa1991b"
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
