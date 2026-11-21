cask "weft" do
  version "0.8.0"
  sha256 "e32d1e7adfa666b79cfc9d378d50c5acfdf85c9183637cacd9107f586f840465"

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
