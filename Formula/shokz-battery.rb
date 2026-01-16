class ShokzBattery < Formula
  desc "Check your Shokz headset battery level from the command line"
  homepage "https://github.com/roelvangils/shokz-battery"
  url "https://github.com/roelvangils/shokz-battery/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "2c7f1771417ce3dae28df88fe2e91b35bc9f23e374e11ed7b12c2de8ae9f50a7"
  license "MIT"

  depends_on :macos

  def install
    bin.install "shokz-battery.py" => "shokz-battery"
  end

  test do
    # Just test that the script runs (will fail without Shokz Connect logs, but that's OK)
    system "#{bin}/shokz-battery", "--version"
  end
end
