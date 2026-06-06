class Consol < Formula
  desc "Smart contract console for Solidity and EVM development"
  homepage "https://github.com/luweiCN/consol"
  url "https://github.com/luweiCN/consol/archive/refs/tags/v0.12.1.tar.gz"
  sha256 "21ef74382d576565a7d6814defd16e7d8007dd7e38d7781074225b1ac83f056f"
  license "MIT"

  depends_on "bun" => :build
  depends_on "foundry"

  def install
    ENV["BUN_INSTALL_CACHE_DIR"] = buildpath/".bun-cache"
    ENV.append "CXXFLAGS", "-std=c++20"
    system "bun", "install", "--frozen-lockfile"
    system "bun", "run", "package:build"
    bin.install "dist/consol"
  end

  test do
    assert_match "consol #{version}", shell_output("#{bin}/consol --version")
    assert_match '"ok": true', shell_output("#{bin}/consol doctor --json")
  end
end
