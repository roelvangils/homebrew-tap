cask "magic-hinge" do
  version "0.9.0"
  sha256 "338bc3cb7e3a673025dc978ab6761c7ca16934b86f0d9d777e5fbf8907cf9606"

  url "https://github.com/roelvangils/magic-hinge/releases/download/v#{version}/Magic-Hinge-#{version}.dmg"
  name "Magic Hinge 0.9 Beta"
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
