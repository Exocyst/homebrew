require 'formula'

class Yeti < Formula
  homepage 'http://mth.github.com/yeti/'
  url 'https://github.com/mth/yeti/tarball/v0.9.7'
  sha1 'cf94e3165397cfdf1b9cf348d414af4e17cbcb34'

  head 'https://github.com/mth/yeti.git'

  def install
    system "ant jar"

    prefix.install "yeti.jar"
    (bin+'yeti').write <<-EOS.undent
      #!/bin/sh
      YETI=#{prefix}/yeti.jar
      java -server -jar "$YETI" "$@"
      EOS
  end
end
