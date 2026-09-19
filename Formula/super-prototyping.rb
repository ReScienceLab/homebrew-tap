class SuperPrototyping < Formula
  desc "Prototyping skills for coding agents, with a tldraw canvas for the mockups"
  homepage "https://prototyping.rescience.com"
  url "https://github.com/ReScienceLab/super-prototyping/archive/refs/tags/super-prototyping--v1.5.0.tar.gz"
  version "1.5.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000" # filled by the release
  license "Apache-2.0"

  livecheck do
    url "https://github.com/ReScienceLab/super-prototyping/tags"
    regex(/^super-prototyping--v(\d+(?:\.\d+)+)$/i)
  end

  depends_on "node"

  # The canvas app, built by the release workflow and attached to the release.
  resource "canvas" do
    url "https://github.com/ReScienceLab/super-prototyping/releases/download/super-prototyping--v1.5.0/canvas-dist.tgz"
    sha256 "0000000000000000000000000000000000000000000000000000000000000000" # filled by the release
  end

  def install
    plugin = libexec/"plugin"
    plugin.install "skills", ".claude-plugin", ".codex-plugin", ".codebuddy-plugin", "plugin.json"
    (plugin/"canvas").install "canvas/package.json"
    resource("canvas").stage { (plugin/"canvas/dist").install Dir["*"] }
  end

  def caveats
    <<~EOS
      The skills and the canvas app are in
        #{opt_libexec}/plugin
      sp-canvas, refkit and artgen are a Python package the agent installs when a
      skill needs one:
        uv tool install "git+https://github.com/ReScienceLab/super-prototyping@super-prototyping--v#{version}#subdirectory=tools"
    EOS
  end

  test do
    assert_path_exists libexec/"plugin/canvas/dist/server.mjs"
    assert_match "prototyping-canvas", (libexec/"plugin/canvas/package.json").read
  end
end
