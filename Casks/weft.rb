cask "weft" do
  version "0.8.0"
  sha256 "841d79bf782397f2db70c71bf5f0dd6a77a7f83f434479048a81a2bc21b3df49"

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
