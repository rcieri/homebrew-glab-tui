class GlabTui < Formula
  desc "Terminal user interface for GitLab and GitHub"
  homepage "https://github.com/rcieri/glab-tui"
  license "MIT"

  depends_on "gh"
  depends_on "glab" => :recommended

  # Discovered at release time: variant (ubuntu-XX.YY or "musl") -> sha256.
      {
        "musl" => "90a5f4af647bc6562390c016ae8fca211f8f2eeacd8614dbe15590b2cd93e73d",
        "ubuntu-22.04" => "cd9993e7d74a2745d7ab1fab207989a2ca8e1cb2670df8b9aa09a61647f0e25d",
        "ubuntu-24.04" => "15df9837d74b9486ce584e5f6426513c7c49c9798c0e894d8b7ac9e1dee89b5d"
      }.freeze
      {
        "musl" => "e90f64a3c8f29d52ffada02363e168c341a0f8e39182cee111070f0efaa1991b",
        "ubuntu-22.04" => "f3001169b4e8c926c148eebec0d981e6ad93869d8c0b627ff991d9a38550565f",
        "ubuntu-24.04" => "49d280801bb7882cd2c38d9f321f8d5a2c0c2f1195f711a84c7b25485e9df778"
      }.freeze

  # Pick the best-matching variant for the local Ubuntu version. Non-Ubuntu
  # Linux distros fall back to the oldest Ubuntu LTS asset (broadest glibc
  # compatibility). If no Ubuntu version asset is available for the current
  # release, fall through to whichever LTS asset is newest.
  def self.linux_variant(sha_map)
    return nil if sha_map.nil? || sha_map.empty?
    v = OS::Version.from_symbol(:ubuntu)
    candidates = []
    if v
      candidates << "ubuntu-\#{v}"
      # Walk down through known LTS baselines (newest first) inserted at
      # the front of the candidate list.
      %w[24.04 22.04].each { |baseline| candidates << "ubuntu-\#{baseline}" unless "ubuntu-\#{v}" == "ubuntu-\#{baseline}" }
    else
      candidates = %w[ubuntu-24.04 ubuntu-22.04]
    end
    candidates << "musl"
    candidates.uniq.each do |c|
      return c if sha_map.key?(c)
    end
    sha_map.keys.first
  end

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

  on_linux do
    on_intel do
      amd64_variant = linux_variant(LINUX_AMD64_SHAS)
      url "https://github.com/rcieri/glab-tui/releases/download/v0.9.0/glab-tui-linux-amd64-\#{amd64_variant}.tar.gz"
      sha256 LINUX_AMD64_SHAS.fetch(amd64_variant)
    end
    on_arm do
      arm64_variant = linux_variant(LINUX_ARM64_SHAS)
      url "https://github.com/rcieri/glab-tui/releases/download/v0.9.0/glab-tui-linux-arm64-\#{arm64_variant}.tar.gz"
      sha256 LINUX_ARM64_SHAS.fetch(arm64_variant)
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
