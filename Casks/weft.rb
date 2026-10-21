cask "weft" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.6.1"
  sha256 arm:   "50342a751b7fe80078d9088287e19516dfa3931cd15bcc10a673b8dd65412fca",
         intel: "e8bf80be61b09dae6d86606fd8dad5b239e8bacecfaca62ddc21d36d074e0182"

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
