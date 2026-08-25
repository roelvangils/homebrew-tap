class ShokzBattery < Formula
  desc "Check your Shokz headset battery level from the command line"
  homepage "https://github.com/roelvangils/shokz-battery"
  url "https://github.com/roelvangils/shokz-battery/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "fece1ff7e121ffe3e3afebab39f8484b2ddeccc827de7d0771e64f80abede123"
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
