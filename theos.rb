class Theos < Formula
  homepage "http://theiphonewiki.net/index.php/Theos"
  head "https://github.com/kirb/theos.git", :branch => "master"

  depends_on "ldid"
  depends_on "dpkg"
  depends_on :xcode

  def install
    (prefix/"root").install Dir["*"]

    bin.install_symlink prefix/"root"/"logos.pl" => "logos"
    bin.install_symlink prefix/"root"/"logify.pl" => "logify"

    bin.install_symlink prefix/"root"/"nic.pl" => "nic"
    bin.install_symlink prefix/"root"/"nicify.pl" => "nicify"
    bin.install_symlink prefix/"root"/"denicify.pl" => "denicify"

    HOMEBREW_PREFIX.install_symlink prefix/"root" => "theos"
  end

  def caveats; <<-EOS.undent
    Theos has been installed to #{HOMEBREW_PREFIX}/theos.
    If you already had Theos installed elsewhere, you might want to make a symlink
    of your own:

      ln -s #{HOMEBREW_PREFIX}/theos /opt/theos
    EOS
  end

  test do
    require "open3"
    Open3.popen3("#{bin}/nic --packagename=sh.brew.test --name=test --template=iphone/tweak") do |stdin, _, _|
      stdin.write "com.apple.springboard\nSpringBoard\n"
    end

    system bin/"logos", "test/Tweak.xm"
  end
end
