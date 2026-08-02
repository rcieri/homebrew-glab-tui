class GlabTui < Formula
  desc "Terminal user interface for GitLab and GitHub"
  homepage "https://github.com/rcieri/glab-tui"
  license "MIT"

  depends_on "gh"
  depends_on "glab" => :recommended

  on_macos do
    on_intel do
      url "https://github.com/rcieri/glab-tui/releases/download/v0.8.2/glab-tui-macos-amd64.tar.gz"
      sha256 "2041ab11ccda1eda3efa0219ff492da724e83f05ed3b86d5024368d2d346cde5"
    end
    on_arm do
      url "https://github.com/rcieri/glab-tui/releases/download/v0.8.2/glab-tui-macos-arm64.tar.gz"
      sha256 "4d0ef8279d89092e8fd8d3a112c088c7e88c762b08e9b4823e60e59663864878"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/rcieri/glab-tui/releases/download/v0.8.2/glab-tui-linux-amd64.tar.gz"
      sha256 "040b56a0fe0b927fa9f4b98304b0e1ba1271a31dd20da8de1b093b686bebc647"
    end
    on_arm do
      url "https://github.com/rcieri/glab-tui/releases/download/v0.8.2/glab-tui-linux-arm64.tar.gz"
      sha256 "bf7d5b8ccf59a1b872a7f69e65335353e821be1e9f4e831611491457a1f4d689"
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
