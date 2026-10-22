cask "weft" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.6.3"
  sha256 arm:   "c0f1785b7b2f10452f1d1273ae385af88d08f006461009aacf5cf2dd2dcb214a",
         intel: "0d5dba23b7e491ae170752c47a0dfa0c29c546c980ff55882349374b65f5a6f1"

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
