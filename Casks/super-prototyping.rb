cask "super-prototyping" do
  arch arm: "arm64", intel: "x64"

  version "1.5.2"
  sha256 arm:   "a54d2378174060539d61a4571155c93e503b7810ffa99a83afc98c15a198a86a",
         intel: "8dc5e2f849557093824be90026cae66f223bbfb7170556c6badb03c6f9398da1"

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
