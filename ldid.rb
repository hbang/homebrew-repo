class Ldid < Formula
  homepage "https://cydia.saurik.com/info/ldid/"
  url "https://git.saurik.com/ldid.git",
    :tag => "v1.1.2",
    :revision => "0204ccf74a729c6cc83f2a5e1be3bc1c728b7ccb"

  head "https://git.saurik.com/ldid.git", :branch => "master"

  def install
    system "./make.sh"
    bin.install "ldid"
  end

  test do
    (testpath/"test.c").write <<-EOS.undent
      int main(int argc, char **argv) { return 0; }
      EOS

    system "#{ENV.cc}", "test.c", "-o", "test"
    system bin/"ldid", "-S", "test"
  end
end