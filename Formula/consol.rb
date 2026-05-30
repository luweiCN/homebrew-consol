class Consol < Formula
  desc "Smart contract console for Solidity and EVM development"
  homepage "https://github.com/luweiCN/consol"
  url "https://github.com/luweiCN/consol/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "ae25b74ca4762cdffd4f25c511f5484727f0037568079956e7b894acc02e9898"
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
