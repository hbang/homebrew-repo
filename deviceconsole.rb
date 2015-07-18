class Deviceconsole < Formula
  homepage "https://github.com/rpetrich/deviceconsole"
  head "https://github.com/cbowns/deviceconsole.git", :branch => "master"

  def install
    system "xcodebuild",
      "-project", "deviceconsole.xcodeproj",
      "-target", "deviceconsole",
      "-configuration", "Release",
      "clean", "install",
      "SYMROOT=build",
      "DSTROOT=build"

    bin.install "build/usr/local/bin/deviceconsole"
  end

  test do
    system bin/"deviceconsole", "--help"
  end
end
