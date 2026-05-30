class Consol < Formula
  desc "Smart contract console for Solidity and EVM development"
  homepage "https://github.com/luweiCN/consol"
  url "https://github.com/luweiCN/consol/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "71df8296c21c5363408ee35e0276288f9f33c65c08fac755995c7c28474c4291"
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
