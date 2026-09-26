cask "super-prototyping" do
  arch arm: "arm64", intel: "x64"

  version "1.7.0"
  sha256 arm:   "0320b56a8d90e6c0bdc8cf50ee3c298616c2cb5c0c1b518ed27420dfad95d479",
         intel: "c0b08747dfad111094083c330d1f75cf6300bb890114c8003ce055ad34a86e03"

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
