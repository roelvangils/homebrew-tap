class Appearance < Formula
  desc "Command-line utility to toggle macOS appearance between light and dark mode"
  homepage "https://github.com/roelvangils/appearance"
  version "1.0.0"
  license "MIT"

  # We'll use a shell script to download and install the binary
  def install
    # Create a shell script to download the correct binary
    (buildpath/"install.sh").write <<~EOS
      #!/bin/bash
      if [[ $(uname -m) == 'arm64' ]]; then
        curl -s -o appearance https://raw.githubusercontent.com/roelvangils/appearance/main/downloads/appearance-arm64
      else
        curl -s -o appearance https://raw.githubusercontent.com/roelvangils/appearance/main/downloads/appearance-x86_64
      fi
      chmod +x appearance
    EOS
    
    # Make the script executable
    chmod 0755, "install.sh"
    
    # Run the script
    system "./install.sh"
    
    # Install the downloaded binary
    bin.install "appearance"
  end

  test do
    system "#{bin}/appearance", "light" rescue nil
  end
end
