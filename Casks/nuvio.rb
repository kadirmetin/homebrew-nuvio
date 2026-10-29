cask "nuvio" do
  arch arm: "arm64", intel: "x86_64"

  version "0.1.33-alpha"
  sha256 :no_check

  url "https://github.com/NuvioMedia/NuvioDesktop/releases/download/#{version}/Nuvio-macOS-#{arch}-#{version}.dmg"
  name "Nuvio"
  desc "Media client for browsing, collecting, downloading, and streaming"
  homepage "https://github.com/NuvioMedia/NuvioDesktop"

  depends_on :macos

  app "Nuvio.app"

  postflight_steps do
    # The upstream app is ad-hoc signed but not notarized.
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Nuvio.app"]
  end
end
