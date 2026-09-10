cask "nuviodesktop" do
  arch arm: "arm64", intel: "x86_64"

  version "0.1.23-alpha"
  sha256 :no_check

  url "https://github.com/NuvioMedia/NuvioDesktop/releases/download/#{version}/Nuvio-macOS-#{arch}-#{version}.dmg"
  name "Nuvio Desktop"
  desc "Nuvio Desktop is a media client for browsing metadata, managing collections and watch progress, downloading media, and playing streams from user-installed extensions or user-provided sources."
  homepage "https://github.com/NuvioMedia/NuvioDesktop"

  app "Nuvio.app"

  postflight do
    ohai "Patching Nuvio with bash script"
    system_command "/bin/bash",
      args: [
        "-c",
        # We use single quotes (<<~'EOS') so Ruby doesn't try to parse the bash variables
        <<~'EOS'
          APP="/Applications/Nuvio.app"
          TARGET_USER=${SUDO_USER:-$USER}
          DATA="/Users/$TARGET_USER/Library/Application Support/Nuvio"

          [[ -d "$APP/Contents/app" ]] || {
            echo "Nuvio.app not found in /Applications"
            exit 1
          }

          case "$(uname -m)" in
            arm64) PLATFORM="macos-arm64" ;;
            x86_64) PLATFORM="macos-amd64" ;;
          esac

          # 1. Remove quarantine
          xattr -dr com.apple.quarantine "$APP" 2>/dev/null || true

          # 2. Sign all native code in Nuvio
          while IFS= read -r -d '' file; do
            case "$(file -b "$file")" in
              *Mach-O*) codesign --force --sign - "$file" ;;
            esac
          done < <(find "$APP" -type f -print0)

          # 3. Patch the embedded TorrServer inside the jar
          JAR="$(find "$APP/Contents/app" -maxdepth 1 -name 'composeApp-desktop-*.jar' -print -quit)"
          RESOURCE="torrserver/$PLATFORM/TorrServer"
          TEMP="$(mktemp -d)"
          mkdir -p "$TEMP/patch/$(dirname "$RESOURCE")"
          unzip -p "$JAR" "$RESOURCE" > "$TEMP/patch/$RESOURCE"
          chmod +x "$TEMP/patch/$RESOURCE"
          codesign --force --sign - "$TEMP/patch/$RESOURCE"

          cp "$JAR" "$TEMP/patched.jar"
          (
            cd "$TEMP/patch"
            zip -q -u "$TEMP/patched.jar" "$RESOURCE"
          )
          cp "$TEMP/patched.jar" "$JAR"

          # 4. Sign the whole app deeply
          codesign --force --deep --sign - "$APP"

          # 5. Extract and sign the Application Support TorrServer copy
          TORRSERVER="$DATA/torrserver/bin/$PLATFORM/TorrServer"
          mkdir -p "$(dirname "$TORRSERVER")"
          cp "$TEMP/patch/$RESOURCE" "$TORRSERVER"
          chmod +x "$TORRSERVER"
          codesign --force --sign - "$TORRSERVER"
          chown -R "$TARGET_USER" "$DATA/torrserver"

          rm -rf "$TEMP"
        EOS
      ],
      sudo: true
    ohai "Nuvio patched, good to go."
  end
end
