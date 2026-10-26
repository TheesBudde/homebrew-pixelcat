cask "pixelcat" do
  version "7.0"
  sha256 "866013d50f7ecf5a9e07636d46b4808fe22c7d1496998f76896041d715e9a63d"

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

  zap trash: [
    "~/Library/Application Support/Pixelcat",
    "~/Library/Preferences/local.pixelkatze.plist",
  ]

  caveats <<~EOS
    Pixelcat is not notarized by Apple. This cask removes the quarantine flag so it opens normally.
    If you enable "Cat bed in the Dock", macOS may ask for Accessibility access. It is optional
    and has to be granted again after each update.
  EOS
end
