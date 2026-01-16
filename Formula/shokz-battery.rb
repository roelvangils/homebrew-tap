class ShokzBattery < Formula
  desc "Check your Shokz headset battery level from the command line"
  homepage "https://github.com/roelvangils/shokz-battery"
  url "https://github.com/roelvangils/shokz-battery/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "b9ee823f8b2b5085fbf3f23cac8676d228558e8e2f5ec3236d5d39f2a25ed4b6"
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
