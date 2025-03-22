class Appearance < Formula
  desc "Command-line utility to toggle macOS appearance between light and dark mode"
  homepage "https://github.com/roelvangils/appearance"
  version "1.0.0"
  license "MIT"

  # Add a URL - this is required by Homebrew
  if Hardware::CPU.arm?
    url "https://raw.githubusercontent.com/roelvangils/appearance/main/downloads/appearance-arm64"
    sha256 "45edfb9d49aea7b69757aebe0d7c0a8bb45eb4b8cb9af0e66636a9af27d99772"
  else
    url "https://raw.githubusercontent.com/roelvangils/appearance/main/downloads/appearance-x86_64"
    sha256 "60166484759a80decc1f6ed266ae907748d7f6d5389b3b96f9179e9912e9a286"
  end

  def install
    # The binary is downloaded directly to the temporary directory
    # We just need to install it with the correct name
    bin.install Pathname.pwd.children.first => "appearance"
    chmod 0755, bin/"appearance"
  end

  test do
    system "#{bin}/appearance", "light" rescue nil
  end
end
