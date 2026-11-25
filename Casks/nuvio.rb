cask "nuvio" do
  arch arm: "arm64", intel: "x86_64"

  version "0.1.39-alpha"
  sha256 arm:   "a0d5e03d99b986eaa6fe2c8b195654d52ace592f0ff10e56eeedde11e986a377",
         intel: "0bd769b414af863da789c9a778ae2517eef18d554c680d136f39ea6495caa6ed"

  url "https://github.com/NuvioMedia/NuvioDesktop/releases/download/#{version}/Nuvio-macOS-#{arch}-#{version}.dmg"
  name "Nuvio"
  desc "Media client for browsing, collecting, downloading, and streaming"
  homepage "https://github.com/NuvioMedia/NuvioDesktop"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Nuvio.app"

  postflight_steps do
    # The upstream app is ad-hoc signed but not notarized.
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Nuvio.app"]
  end

  zap trash: [
    "~/Library/Application Support/Nuvio",
    "~/Library/Caches/com.nuvio.media.desktop",
    "~/Library/Caches/Nuvio",
    "~/Library/HTTPStorages/com.nuvio.media.desktop",
    "~/Library/WebKit/com.nuvio.media.desktop",
  ]
end
