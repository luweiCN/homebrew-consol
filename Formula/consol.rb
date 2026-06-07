class Consol < Formula
  desc "Smart contract console for Solidity and EVM development"
  homepage "https://github.com/luweiCN/consol"
  url "https://github.com/luweiCN/consol/archive/refs/tags/v0.12.4.tar.gz"
  sha256 "fe46a85810c623250c1faad064346c521a90e4b625b5fd9ad11d48032950af3a"
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
