# homebrew-nuvio

This is the custom Homebrew tap for [Nuvio Desktop](https://github.com/NuvioMedia/NuvioDesktop). 

Nuvio Desktop is a cross-platform media client for browsing metadata, managing collections, downloading media, and playing streams from user-installed extensions or user-provided sources.

## Install

To install Nuvio Desktop on macOS using Homebrew (`brew`), run the following commands in your terminal:

```bash
# Add the tap
brew tap kadirmetin/nuvio

# Trust the tap (Required for Homebrew 6.0.0 and later)
brew trust kadirmetin/nuvio

# Install the application
brew install --cask nuviodesktop
```

## Upgrade

To upgrade Nuvio Desktop to the latest version when a new release is available in this tap, run:

```bash
brew update
brew upgrade --cask nuviodesktop
```

## Uninstall

If you want to uninstall Nuvio Desktop and remove this tap from your system, run the following commands:

```bash
brew uninstall --cask nuviodesktop
brew untap kadirmetin/nuvio
```
