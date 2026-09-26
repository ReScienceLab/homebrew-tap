cask "super-prototyping" do
  arch arm: "arm64", intel: "x64"

  version "1.6.4"
  sha256 arm:   "11288295b68904437e4d255f3aa3846be5a46579dceb18b09c2053b27d8c1d31",
         intel: "103f9a51bc60fe27071c19a562db4948ee0f1512a7b5a9af5055445fb1a4cdea"

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
