cask "nuviodesktop" do
  arch arm: "arm64", intel: "x86_64"

  version "0.1.11-alpha"
  sha256 :no_check

  url "https://github.com/NuvioMedia/NuvioDesktop/releases/download/#{version}/Nuvio-macOS-#{arch}-#{version}.dmg"
  name "Nuvio Desktop"
  desc "Nuvio Desktop is a media client for browsing metadata, managing collections and watch progress, downloading media, and playing streams from user-installed extensions or user-provided sources."
  homepage "https://github.com/NuvioMedia/NuvioDesktop"

  app "Nuvio.app"
end
