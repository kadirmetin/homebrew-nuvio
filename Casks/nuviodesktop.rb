cask "nuviodesktop" do
  arch arm: "arm64", intel: "x86_64"

  version :latest
  sha256 :no_check

  url "https://github.com/NuvioMedia/NuvioDesktop/releases/latest/download/Nuvio-macOS-#{arch}.dmg"
  name "NuvioDesktop"
  desc "Nuvio Desktop Application"
  homepage "https://github.com/NuvioMedia/NuvioDesktop"

  app "Nuvio.app"
end
