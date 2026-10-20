cask "weft" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.6.0"
  sha256 arm:   "94cf5ab455a5c9d1c61ba63c71ba896ad7a3e5f2e9a555f32da140259929237e",
         intel: "1e2d19fbeb4cbb545d2d4b276595b44f8aa36c2661f05f54538db3342dedf11f"

  url "https://github.com/fab7hq/weft/releases/download/v#{version}/fab7-v#{version}-#{arch}-apple-darwin.tar.gz"
  name "Weft"
  desc "Coding agents in panes, with what was asked, checked and decided"
  homepage "https://github.com/fab7hq/weft"

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
