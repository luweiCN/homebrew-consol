class Consol < Formula
  desc "Smart contract console for Solidity and EVM development"
  homepage "https://github.com/luweiCN/consol"
  url "https://github.com/luweiCN/consol/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "6339389bab21324696fe7721ba0a74ce579dc8ffef30308c6462f36cbfd7ebd0"
  license "MIT"

  depends_on "rust" => :build
  depends_on "foundry"

  def install
    system "cargo", "install", *std_cargo_args(path: "apps/cli")
  end

  test do
    assert_match "consol #{version}", shell_output("#{bin}/consol --version")
    assert_match "ConSol", shell_output("#{bin}/consol --help")
  end
end
