class Ch < Formula
  desc "Cheatsheet generator with markdown rendering"
  homepage "https://github.com/nicholascross/ch.sh"
  url "https://github.com/nicholascross/ch.sh/archive/refs/tags/0.0.4.tar.gz"
  sha256 "df5e02e9834f693504096d663c5f0135bff1c57e4829d7a902b1b5ca14600c63"
  version "0.0.4"

  depends_on "glow"
  depends_on "nicholascross/promptly/promptly"
  depends_on "fzf"

  def install
    bin.install "ch" => "ch"
    pkgshare.install "theme.json"
  end

  def post_install
    require "fileutils"
    config_path = File.join(ENV["HOME"], ".config", "ch.sh")
    FileUtils.mkdir_p config_path
    FileUtils.cp pkgshare/"theme.json", File.join(config_path, "theme.json")
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
