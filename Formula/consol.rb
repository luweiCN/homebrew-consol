class Consol < Formula
  desc "Smart contract console for Solidity and EVM development"
  homepage "https://github.com/luweiCN/consol"
  url "https://github.com/luweiCN/consol/archive/refs/tags/v0.13.1.tar.gz"
  sha256 "2689cf2c7db74c9a0e3ee6000c0c2d8828a9fc1fabb22fb4b51599f1360d6414"
  license "MIT"

  depends_on "bun" => :build
  depends_on "foundry"

  def install
    ENV["BUN_INSTALL_CACHE_DIR"] = buildpath/".bun-cache"
    ENV.append "CXXFLAGS", "-std=c++20"
    system "bun", "install", "--frozen-lockfile", "--ignore-scripts"
    system "bun", "run", "package:build"
    bin.install "dist/consol"
  end

  test do
    assert_match "consol #{version}", shell_output("#{bin}/consol --version")
    assert_match '"ok": true', shell_output("#{bin}/consol doctor --json")
  end
end
