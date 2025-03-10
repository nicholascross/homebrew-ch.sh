class Ch < Formula
  desc "Cheatsheet generator with markdown rendering"
  homepage "https://github.com/nicholascross/ch.sh"
  url "https://github.com/nicholascross/ch.sh/archive/refs/tags/0.0.2.tar.gz"
  sha256 "07a6aae62d1b4041b310841089be6a1ee07cf03d5596235fc13ef57077e89758"
  version "0.0.2"

  depends_on "glow"
  depends_on "nicholascross/promptly/promptly"
  depends_on "fzf"

  def install
    bin.install "ch.sh" => "ch"
    pkgshare.install "theme.json"
  end

  def post_install
    config_path = File.join(ENV["HOME"], ".config", "ch.sh")
    mkdir_p config_path
    cp pkgshare/"theme.json", File.join(config_path, "theme.json")
  end

  test do
    assert_predicate bin/"ch", :executable?
    assert_match "Usage", shell_output("\#{bin}/ch --help")
  end

  def caveats
    <<~EOS
      A default theme has been installed to:
        \#{ENV["HOME"]}/.config/ch.sh/theme.json

      You can edit this file to customize your theme.
    EOS
  end
end
