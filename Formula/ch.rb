class Ch < Formula
  desc "Cheatsheet generator with markdown rendering"
  homepage "https://github.com/nicholascross/ch.sh"
  url "https://github.com/nicholascross/ch.sh/archive/refs/tags/0.0.5.tar.gz"
  sha256 "50f485f284ec781c9b42489e377bb031ea0092713a8be538c1aecce0d6030655"
  version "0.0.5"

  depends_on "glow"
  depends_on "nicholascross/promptly/promptly"
  depends_on "fzf"

  def install
    bin.install "ch" => "ch"
    pkgshare.install "theme.json"
  end

  test do
    assert_predicate bin/"ch", :executable?
    assert_match "Usage", shell_output("\#{bin}/ch --help")
  end

  def caveats
    <<~EOS
      A custom theme can be installed to:
        ~/.config/ch.sh/theme.json

      If this file doesn't exist it will use the default theme
        /share/ch/theme.json
    EOS
  end
end
