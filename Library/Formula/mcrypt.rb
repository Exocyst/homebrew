require 'formula'

class Mcrypt < Formula
  homepage 'http://mcrypt.sourceforge.net/'
  url 'http://sourceforge.net/projects/mcrypt/files/MCrypt/2.6.8/mcrypt-2.6.8.tar.gz'
  sha1 '8ae0e866714fbbb96a0a6fa9f099089dc93f1d86'

  depends_on 'libmcrypt'
  depends_on 'mhash'

  def patches
    # fixes outdated dependency on malloc.h
    DATA
  end

  def install
    system "./configure", "--prefix=#{prefix}",
                          "CMAKE_LIBRARY_PATH=/usr/local/lib",
                          "CMAKE_INCLUDE_PATH=/usr/local/include",
                          "--mandir=#{man}"
    system "make install"
  end
end

__END__
diff --git a/src/rfc2440.c b/src/rfc2440.c
index 5a1f296..a33e2b6 100644
--- a/src/rfc2440.c
+++ b/src/rfc2440.c
@@ -23,7 +23,7 @@
 #include <zlib.h>
 #endif
 #include <stdio.h>
-#include <malloc.h>
+// #include <malloc.h>

 #include "xmalloc.h"
 #include "keys.h"
