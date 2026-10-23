cask "weft" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.6.4"
  sha256 arm:   "54e258b4e46646d38b4c7d4692c758efcab6ed1e831cd0188b6e79df44ff0a16",
         intel: "dd544a03c2c90ad925d59c7db24686b8404ce71995eacd52b4baa35b19bcc809"

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
