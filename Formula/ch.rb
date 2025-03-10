class Ch < Formula
  desc "Cheatsheet generator with markdown rendering"
  homepage "https://github.com/nicholascross/ch.sh"
  url "https://github.com/nicholascross/ch.sh/archive/refs/tags/0.0.6.tar.gz"
  sha256 "a4efe401b5d488c940045910721b7b29073bd45101618fbcfe43cdb67f646641"
  version "0.0.6"

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
        $(brew --prefix ch)/share/ch/theme.json
    EOS
  end
end
