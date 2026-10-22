cask "pixelcat" do
  version "6.1"
  sha256 "8b676ad625f60d0b9ad931f877550eec4d6693fc947facbb49f42c5ae34985cb"

  url "https://github.com/TheesBudde/pixelcat/releases/download/v#{version}/Pixelcat-v#{version}.zip"
  name "Pixelcat"
  desc "Pixel-art cat that lives on the Dock and reminds you to take breaks"
  homepage "https://github.com/TheesBudde/pixelcat"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Pixelcat.app"

  # Pixelcat is signed ad hoc, not notarized: without this, macOS refuses to open it on first launch.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Pixelcat.app"]
  end

  uninstall quit: "local.pixelkatze"

  zap trash: "~/Library/Preferences/local.pixelkatze.plist"

  caveats <<~EOS
    Pixelcat is not notarized by Apple. This cask removes the quarantine flag so it opens normally.
    If you enable "Cat bed in the Dock", macOS may ask for Accessibility access – it is optional
    and has to be granted again after each update.
  EOS
end
