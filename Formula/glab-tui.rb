class GlabTui < Formula
  desc "Terminal user interface for GitLab and GitHub"
  homepage "https://github.com/rcieri/glab-tui"
  license "MIT"

  depends_on "gh"
  depends_on "glab" => :recommended

  # Discovered at release time: variant (ubuntu-XX.YY or "musl") -> sha256.
      {
        "musl" => "4ea6ecbdcc4310e63539e8e75277866b1697ceefddd72cea2da5b47d26a97ef1",
        "ubuntu-22.04" => "6c014f94d9db3cdf73119ef64ef640c7e3967a75bf49b9cd235c6896faa97806",
        "ubuntu-24.04" => "aace1e87a6ea429a20a6287c87c301ba165070eaf8a2ddbe7f1b3be3af31d085"
      }.freeze
      {
        "musl" => "1fa74116616fd30d104436ec126de16379b2371ffb815cfa5be85ea6391f68d3",
        "ubuntu-22.04" => "5779dcda57e5cd935abcdb4c39c147666b38eb031807ec8e9f2ddddbac4429d8",
        "ubuntu-24.04" => "9a4669c5aae2638c0619b2a5e8f424a7728e78489f0e2bebda216433b721193c"
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
      url "https://github.com/rcieri/glab-tui/releases/download/v0.9.1/glab-tui-macos-amd64.tar.gz"
      sha256 "cb709db2cc2961b454a4b1939d83412e4d586d7d32956f4de78e91f20ff0ab48"
    end
    on_arm do
      url "https://github.com/rcieri/glab-tui/releases/download/v0.9.1/glab-tui-macos-arm64.tar.gz"
      sha256 "8997a3261cc6717ecf9c9f590c7548fc75e12266c008972fbe2209109c4dd6f2"
    end
  end

  on_linux do
    on_intel do
      amd64_variant = linux_variant(LINUX_AMD64_SHAS)
      url "https://github.com/rcieri/glab-tui/releases/download/v0.9.1/glab-tui-linux-amd64-\#{amd64_variant}.tar.gz"
      sha256 LINUX_AMD64_SHAS.fetch(amd64_variant)
    end
    on_arm do
      arm64_variant = linux_variant(LINUX_ARM64_SHAS)
      url "https://github.com/rcieri/glab-tui/releases/download/v0.9.1/glab-tui-linux-arm64-\#{arm64_variant}.tar.gz"
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
