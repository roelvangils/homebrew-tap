class ShokzBattery < Formula
  desc "Check your Shokz headset battery level from the command line"
  homepage "https://github.com/roelvangils/shokz-battery"
  url "https://github.com/roelvangils/shokz-battery/archive/refs/tags/v1.2.1.tar.gz"
  sha256 "ac42b76a6b3b359bfa008986a5bf9e43af8eda2809acfa23ac156195a46427dc"
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
