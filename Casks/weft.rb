cask "weft" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.6.2"
  sha256 arm:   "8eaf95ae90740bb2a0a01babc498d27ff91ba7e6fbeed6729c42be6dc99e676f",
         intel: "07e94b6222d8d49d5ec16d999f778bdf39f501051231dc5ab7ba854aac890633"

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
