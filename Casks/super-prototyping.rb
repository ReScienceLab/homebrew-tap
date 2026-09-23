cask "super-prototyping" do
  arch arm: "arm64", intel: "x64"

  version "1.6.0"
  sha256 arm:   "9f7b41d87c9031c199faa3baee03829261074ce643f5af3d4acfc229dd325007",
         intel: "e94d0a0777579120a47d57dd6c311fac92926e46ef88a76fb0d96e4425356f6a"

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
