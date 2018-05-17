class Theos < Formula
  homepage "http://theiphonewiki.net/index.php/Theos"
  url "https://github.com/kirb/theos.git", :branch => "master"
  version "stable"

  depends_on :xcode

  # These tools are the most common ones used in conjunction with Theos, but
  # they are not required.
  depends_on "ldid" => :recommended
  depends_on "dpkg" => :recommended

  keg_only <<~EOS
    Theos is intended to be self-contained. It also contains "include" and "lib"
    directories that should not be mixed with the system's. (Ignore the generic
    message from Homebrew below.)
  EOS

  def install
    prefix.install Dir["*"]
  end

  def caveats; <<~EOS
    Theos has been installed to #{opt_prefix}.

    To use Theos, you must first set the $THEOS variable in your environment, and
    add the bin directory to your $PATH:

      export THEOS=#{opt_prefix}
      export PATH=$THEOS/bin:$PATH

    The #{HOMEBREW_PREFIX}/theos symlink that existed in previous version of this
    formula has been removed. Please use #{opt_prefix}.
  EOS
  end

  test do
    # TODO: this is broken
    require "open3"
    Open3.popen3("#{bin}/nic.pl --packagename=sh.brew.test --name=test --template=iphone/tweak") do |stdin, _, _|
      stdin.write "com.apple.springboard\nSpringBoard\n"
    end

    cd "test" do
      system bin/"logos", "Tweak.xm"
      system "make"
    end
  end
end
