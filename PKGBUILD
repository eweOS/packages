# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=docbook-xsl
pkgver=1.79.2
pkgrel=1
pkgdesc='XML stylesheets for Docbook-xml transformations'
url='https://docbook.org/'
arch=(any)
license=(custom)
install=$pkgname.install
source=(https://github.com/docbook/xslt10-stylesheets/releases/download/release%2F$pkgver/docbook-xsl{,-nons}-$pkgver.tar.gz
        765567_non-recursive_string_subst.patch)
sha256sums=('966188d7c05fc76eaca115a55893e643dd01a3486f6368733c9ad974fcee7a26'
            'f89425b44e48aad24319a2f0d38e0cb6059fdc7dbaf31787c8346c748175ca8e'
            '193ec26dcb37bdf12037ed4ea98d68bd550500c8e96b719685d76d7096c3f9b3')

prepare() {
  cd $pkgname-$pkgver
  patch -Np2 -i ../765567_non-recursive_string_subst.patch

  cd ../$pkgname-nons-$pkgver
  patch -Np2 -i ../765567_non-recursive_string_subst.patch
}

package() {
  depends=(libxml2 libxslt docbook-xml)

  local pkgroot ns dir
  for ns in -nons ''; do
    pkgroot="$pkgdir/usr/share/xml/docbook/xsl-stylesheets-$pkgver$ns"
    dir=$pkgname$ns-$pkgver

    install -Dt "$pkgroot" -m644 $dir/VERSION{,.xsl}

    (
      shopt -s nullglob  # ignore missing files
      for fn in assembly common eclipse epub epub3 fo highlighting html \
        htmlhelp javahelp lib manpages params profiling roundtrip template \
        website xhtml xhtml-1_1 xhtml5
      do
        install -Dt "$pkgroot/$fn" -m644 $dir/$fn/*.{xml,xsl,dtd,ent}
      done
    )
  done

  install -d "$pkgdir/etc/xml"
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $dir/COPYING
}

