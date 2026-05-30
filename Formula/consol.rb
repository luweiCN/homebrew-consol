class Consol < Formula
  desc "Smart contract console for Solidity and EVM development"
  homepage "https://github.com/luweiCN/consol"
  url "https://github.com/luweiCN/consol/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "e823837ae844246b123e76bcd56beaada8f89a3a6aff0cf086bbf665c4904637"
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
