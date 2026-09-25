cask "super-prototyping" do
  arch arm: "arm64", intel: "x64"

  version "1.6.3"
  sha256 arm:   "a78bbe95e19484d21944f02de8c9eb9cc0f6a122293efbe400e9c89cd65a0b82",
         intel: "f869f93ae5f60ce1853948125a996948afb005ff706ff86f54088bfd8e62c826"

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
