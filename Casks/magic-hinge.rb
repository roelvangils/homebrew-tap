cask "magic-hinge" do
  version "0.9.1"
  sha256 "ae83350d7ef31a4b82344393318426052d5bf30bdde8c0ca7bde25f44d4b58ac"

  url "https://github.com/roelvangils/magic-hinge/releases/download/v#{version}/Magic-Hinge-#{version}.dmg"
  name "Magic Hinge 0.9.1 Beta"
  desc "Frosted-glass desktop effect controlled by your MacBook hinge"
  homepage "https://roelvangils.github.io/magic-hinge/"

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Magic Hinge.app"

  # Sonoma 14.0/14.1 are insufficient for SCScreenshotManager.
  preflight do
    if MacOS.version < MacOSVersion.new("14.2")
      odie "Magic Hinge requires macOS 14.2 or later."
    end
  end
end
