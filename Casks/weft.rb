cask "weft" do
  version "0.7.2"
  sha256 "39901fa639235654a372309803316c786af416b55b0ce8d6da6e5cdc71c9caef"

  url "https://github.com/fab7hq/weft/releases/download/v#{version}/fab7-v#{version}-aarch64-apple-darwin.tar.gz"
  name "Weft"
  desc "Coding agents in panes, with what was asked, checked and decided"
  homepage "https://github.com/fab7hq/weft"

  depends_on arch: :arm64
  depends_on macos: :monterey

  app "Weft.app"
  binary "#{appdir}/Weft.app/Contents/MacOS/weft"
  binary "#{appdir}/Weft.app/Contents/MacOS/ringframe"

  # Signed ad hoc: without its quarantine it opens from Finder and the Dock.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Weft.app"]
  end

  zap trash: "~/.fab7/weft"
end
