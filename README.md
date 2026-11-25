# homebrew-nuvio

This is the custom Homebrew tap for [Nuvio](https://github.com/NuvioMedia/NuvioDesktop).

Nuvio is a cross-platform media client for browsing metadata, managing collections, downloading media, and playing streams from user-installed extensions or user-provided sources.

## Install

To install Nuvio on macOS using Homebrew (`brew`), run the following commands in your terminal:

```bash
# Add the tap
brew tap kadirmetin/nuvio

# Trust the tap (Required for Homebrew 6.0.0 and later)
brew trust kadirmetin/nuvio

# Install the application
brew install --cask nuvio
```

## Upgrade

This tap is updated automatically. A GitHub Actions workflow checks [NuvioDesktop releases](https://github.com/NuvioMedia/NuvioDesktop/releases) every 6 hours and, when a new version is published, bumps the cask version and its SHA-256 checksums.

To upgrade Nuvio to the latest version, run:

```bash
brew update
brew upgrade --cask nuvio
```

## Uninstall

If you want to uninstall Nuvio and remove this tap from your system, run the following commands:

```bash
brew uninstall --cask nuvio
brew untrust kadirmetin/nuvio
brew untap kadirmetin/nuvio
```

To also remove Nuvio's settings, library data and caches, use `--zap` instead (this cannot be undone):

```bash
brew uninstall --zap --cask nuvio
```

This deletes:

- `~/Library/Application Support/Nuvio`
- `~/Library/Caches/Nuvio`
- `~/Library/Caches/com.nuvio.media.desktop`
- `~/Library/HTTPStorages/com.nuvio.media.desktop`
- `~/Library/WebKit/com.nuvio.media.desktop`