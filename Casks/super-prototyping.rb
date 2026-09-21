cask "super-prototyping" do
  arch arm: "arm64", intel: "x64"

  version "1.5.3"
  sha256 arm:   "f78914baa65bfe5c9841861fa6eefa48ff67122db9fc3fd3b454a9d85339b34b",
         intel: "27890e036d7dad2967641f0b93851cec2ad85ea063690037e2be6d7f6277ab42"

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
