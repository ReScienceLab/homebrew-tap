cask "super-prototyping" do
  arch arm: "arm64", intel: "x64"

  version "1.6.2"
  sha256 arm:   "e6f2f493cbd2fb6931bc2ac65aba13a76c15269d5970ee51cb0eb37814ac77b1",
         intel: "aa38112f15ee69ef1e4c35fd4479ca3fbd5e0c62d3837d8cd56b178bd80db180"

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
