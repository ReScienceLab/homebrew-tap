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
    # manifests, the board template the skills copy to start a board, the canvas app, and
    # `sp`. Not the worked example boards, which are 150MB and on the hosted canvas.
    plugin = libexec/"plugin"
    plugin.install "skills", ".claude-plugin", ".codex-plugin", ".codebuddy-plugin", "plugin.json"
    (plugin/"mockups/canvases").install "mockups/canvases/templates"
    (plugin/"canvas").install "canvas/package.json"
    (plugin/"tools").install "tools/sp_canvas.py"
    resource("canvas").stage { (plugin/"canvas/dist").install Dir["*"] }

    # `sp` is the toolkit's launcher, run from this tree on the python3 the Command Line
    # Tools ship: it is standard library only. The rest of the toolkit (refkit, artgen)
    # the agent installs with uv when a skill calls for it, and the `sp` that brings is
    # this same file, so the two never disagree on what `sp stop` does.
    (bin/"sp").write <<~SH
      #!/bin/bash
      export SUPER_PROTOTYPING_ROOT="#{opt_libexec}/plugin"
      export PATH="#{formula_opt_bin("node")}:$PATH"
      exec python3 "$SUPER_PROTOTYPING_ROOT/tools/sp_canvas.py" "$@"
    SH
    chmod 0755, bin/"sp"
  end

  def caveats
    <<~EOS
      Start the canvas for a project, from anywhere:
        sp start ~/my-project
      It serves that directory's mockups/canvases at http://127.0.0.1:5173 and
      opens the browser. With no directory it is the current one. sp stop stops it.
    EOS
  end

  test do
    assert_path_exists libexec/"plugin/canvas/dist/server.mjs"
    assert_path_exists libexec/"plugin/mockups/canvases/templates/gen.py"
    assert_equal (libexec/"plugin").realpath,
                 Pathname(shell_output("#{bin}/sp root").strip).realpath
  end
end
