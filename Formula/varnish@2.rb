# Varnish 2.1.5 has maximum compatibility with Fastly
# https://developer.fastly.com/reference/vcl/

require 'formula'

class VarnishAT2 < Formula
  url 'https://varnish-cache.org/_downloads/varnish-2.1.5.tgz'
  homepage 'http://www.varnish-cache.org/'
  sha256 '2d8049be14ada035d0e3a54c2b519143af40d03d917763cf72d53d8188e5ef83'

  depends_on 'pkg-config' => :build
  depends_on 'pcre'

  # Do not strip varnish binaries: Otherwise, the magic string end pointer isn't found.
  skip_clean :all

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--localstatedir=#{var}"
    system "make install"
    (var+'varnish').mkpath
  end
end
