cask "super-prototyping" do
  arch arm: "arm64", intel: "x64"

  version "1.6.1"
  sha256 arm:   "58741dc74b2431649fd4e1a0e312e0b3ef2bb4644d136941ed6e4e07fdbe85e5",
         intel: "775ddeeeb5e1aaad6106483553de2145a584e16e64b2dbda4f888e89a3c454d5"

  url "https://github.com/ReScienceLab/super-prototyping/releases/download/super-prototyping--v#{version}/Super-Prototyping-#{version}-#{arch}.dmg"
  name "Super Prototyping"
  desc "Prototyping canvas and skills for coding agents"
  homepage "https://github.com/ReScienceLab/super-prototyping"

  auto_updates true
  depends_on macos: :ventura

  app "Super Prototyping.app"

  zap trash: [
    "~/.cache/super-prototyping",
    "~/.local/state/super-prototyping",
    "~/Library/Preferences/com.rescience.super-prototyping.plist",
  ]
end
