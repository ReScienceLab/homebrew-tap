cask "super-prototyping" do
  arch arm: "arm64", intel: "x64"

  version "1.5.1"
  sha256 arm:   "bd079b391c1df909b6f1bf696d951f9ff14f1fbafc29e103792e214f3e2859d0",
         intel: "92bb430ae8e3837ef5eb0ab6a71f8bb230b64e929d258740b0f91925bbd43e5d"

  url "https://github.com/ReScienceLab/super-prototyping/releases/download/super-prototyping--v#{version}/Super-Prototyping-#{version}-#{arch}.dmg"
  name "Super Prototyping"
  desc "Prototyping canvas and skills for coding agents"
  homepage "https://github.com/ReScienceLab/super-prototyping"

  depends_on macos: :ventura

  app "Super Prototyping.app"

  zap trash: [
    "~/.cache/super-prototyping",
    "~/.local/state/super-prototyping",
    "~/Library/Preferences/com.rescience.super-prototyping.plist",
  ]
end
