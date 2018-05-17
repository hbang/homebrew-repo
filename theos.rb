class Theos < Formula
  homepage "https://theos.github.io/"
  url "https://github.com/theos/theos.git", :tag => "2.4"
  head "https://github.com/theos/theos.git"

  depends_on :xcode

  # These tools are the most common ones used in conjunction with Theos, but
  # they are not required.
  depends_on "ldid" => :recommended

  keg_only "Theos is self-contained and must not be mixed with system directories"

  def install
    prefix.install Dir["*"]
  end

  def caveats; <<~EOS
    Theos has been installed to #{opt_prefix}.

    To use Theos, you must first set the $THEOS variable in your environment:

      echo 'export THEOS=#{opt_prefix}' >> #{shell_profile}
      source #{shell_profile}
  EOS
  end

  test do
    require "open3"
    Open3.popen3("#{bin}/nic.pl", "--packagename=sh.brew.test", "--name=test", "--template=iphone/tweak") do |stdin, stdout, _|
      stdin.write "com.apple.springboard\nSpringBoard\n"
      stdin.close
      assert_match "\nDone.", stdout.read
    end

    cd testpath/"test" do
      system bin/"logos.pl", "Tweak.xm"
      system "make", "THEOS=#{opt_prefix}"
    end
  end
end
