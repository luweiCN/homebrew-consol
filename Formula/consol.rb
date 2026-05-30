class Consol < Formula
  desc "Smart contract console for Solidity and EVM development"
  homepage "https://github.com/luweiCN/consol"
  url "https://github.com/luweiCN/consol/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "5eea55ff7ff08b5a5bce75e02fb2f1a79bd52ce127fdbf0cd7d60eb1774ef453"
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
