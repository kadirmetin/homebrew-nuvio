# Nuvio Homebrew Tap: Install Nuvio on macOS with Homebrew

[![Nuvio Desktop release](https://img.shields.io/github/v/release/NuvioMedia/NuvioDesktop?label=Nuvio%20Desktop)](https://github.com/NuvioMedia/NuvioDesktop/releases)
[![Platform: macOS](https://img.shields.io/badge/platform-macOS-lightgrey?logo=apple)](#install-nuvio-on-macos)
[![Last commit](https://img.shields.io/github/last-commit/kadirmetin/homebrew-nuvio)](https://github.com/kadirmetin/homebrew-nuvio/commits)
[![Stars](https://img.shields.io/github/stars/kadirmetin/homebrew-nuvio?style=flat)](https://github.com/kadirmetin/homebrew-nuvio/stargazers)

A custom [Homebrew](https://brew.sh) tap that installs and updates [Nuvio Desktop](https://github.com/NuvioMedia/NuvioDesktop) on macOS with a single `brew` command.

**Nuvio** is a cross-platform media client for browsing metadata, managing collections, downloading media, and playing streams from user-installed extensions or user-provided sources.

## Table of contents

- [Quick install](#quick-install)
- [Install Nuvio on macOS](#install-nuvio-on-macos)
- [Upgrade Nuvio](#upgrade-nuvio)
- [Uninstall Nuvio](#uninstall-nuvio)
- [How automatic updates work](#how-automatic-updates-work)
- [FAQ](#faq)
- [Support](#support)

## Quick install

```bash
brew tap kadirmetin/nuvio
brew trust kadirmetin/nuvio
brew install --cask nuvio
```

## Install Nuvio on macOS

**Requirements:** macOS and [Homebrew](https://brew.sh).

1. **Add the tap**

   ```bash
   brew tap kadirmetin/nuvio
   ```

2. **Trust the tap** (required for Homebrew 6.0.0 and later)

   ```bash
   brew trust kadirmetin/nuvio
   ```

3. **Install the Nuvio cask**

   ```bash
   brew install --cask nuvio
   ```

4. **Verify the installation**

   ```bash
   brew info --cask nuvio
   ```

## Upgrade Nuvio

```bash
brew update
brew upgrade --cask nuvio
```

## Uninstall Nuvio

### Remove the app and the tap

```bash
brew uninstall --cask nuvio
brew untrust kadirmetin/nuvio
brew untap kadirmetin/nuvio
```

### Remove everything, including settings and data

Use `--zap` to also delete Nuvio's settings, library data, and caches. **This cannot be undone.**

```bash
brew uninstall --zap --cask nuvio
```

The following paths are deleted:

- `~/Library/Application Support/Nuvio`
- `~/Library/Caches/Nuvio`
- `~/Library/Caches/com.nuvio.media.desktop`
- `~/Library/HTTPStorages/com.nuvio.media.desktop`
- `~/Library/WebKit/com.nuvio.media.desktop`

## How automatic updates work

This tap updates itself. A GitHub Actions workflow checks [NuvioDesktop releases](https://github.com/NuvioMedia/NuvioDesktop/releases) every 6 hours. When a new version is published, it bumps the cask version and its SHA-256 checksums, so `brew upgrade --cask nuvio` always picks up the latest release.

## FAQ

### How do I install Nuvio on a Mac?

Run the three commands in [Quick install](#quick-install). Homebrew downloads Nuvio Desktop and installs it as a cask.

### Why do I need `brew trust`?

Homebrew 6.0.0 and later requires you to trust a third-party tap before installing from it. Skip this step if you use an older Homebrew version.

### How do I update Nuvio?

Run `brew update` followed by `brew upgrade --cask nuvio`.

### How do I completely remove Nuvio and its data?

Run `brew uninstall --zap --cask nuvio`. See [Uninstall Nuvio](#uninstall-nuvio) for the list of deleted paths.

## Support

- Problem with the cask or this tap: [open an issue](https://github.com/kadirmetin/homebrew-nuvio/issues).
- Problem with the Nuvio app itself: [NuvioDesktop issues](https://github.com/NuvioMedia/NuvioDesktop/issues).
