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
    # The plugin tree the skills and the canvas's chat panel address: the skills, the
    # manifests, the board template the skills copy to start a board, and the canvas app.
    # Not the worked example boards, which are 150MB and on the hosted canvas.
    plugin = libexec/"plugin"
    plugin.install "skills", ".claude-plugin", ".codex-plugin", ".codebuddy-plugin", "plugin.json"
    (plugin/"mockups/canvases").install "mockups/canvases/templates"
    (plugin/"canvas").install "canvas/package.json"
    resource("canvas").stage { (plugin/"canvas/dist").install Dir["*"] }

    # The launcher: the canvas against ./mockups/canvases, in the foreground, with the
    # browser opened. `sp-canvas start` is the detached form, from the Python toolkit the
    # agent installs when a skill calls for it; this needs nothing but node.
    (bin/"super-prototyping").write <<~SH
      #!/bin/bash
      set -eu
      plugin="#{opt_libexec}/plugin"
      export SUPER_PROTOTYPING_ROOT="$plugin"
      export PROTOTYPING_PROJECT_DIR="$PWD"
      export PROTOTYPING_CANVASES_DIR="$PWD/mockups/canvases"
      mkdir -p "$PROTOTYPING_CANVASES_DIR"
      exec "#{formula_opt_bin("node")}/node" "$plugin/canvas/dist/server.mjs" --port "${SP_CANVAS_PORT:-5173}" --open
    SH
    chmod 0755, bin/"super-prototyping"
    bin.install_symlink bin/"super-prototyping" => "sp"
  end

  def caveats
    <<~EOS
      Start the canvas from a project directory:
        cd my-project && sp
      It serves ./mockups/canvases at http://127.0.0.1:5173 and opens the browser.
      Ctrl-C stops it. super-prototyping is the same command.
    EOS
  end

  test do
    assert_path_exists libexec/"plugin/canvas/dist/server.mjs"
    assert_path_exists libexec/"plugin/mockups/canvases/templates/gen.py"
    assert_match "prototyping-canvas", (libexec/"plugin/canvas/package.json").read
    assert_predicate bin/"super-prototyping", :executable?
    assert_predicate bin/"sp", :executable?
  end
end
