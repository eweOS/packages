# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=libxml2
pkgname=(
  libxml2
  libxml2-docs
)
pkgver=2.13.5
pkgrel=1
pkgdesc="XML parsing library, version 2"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('MIT')
depends=('zlib' 'ncurses' 'xz' 'icu')
makedepends=('python')
url="http://www.xmlsoft.org/"
source=(https://download.gnome.org/sources/${pkgbase}/${pkgver%.*}/${pkgbase}-${pkgver}.tar.xz)
sha256sums=('74fc163217a3964257d3be39af943e08861263c4231f9ef5b496b6f6d4c7b2b6')

build()
{
  cd ${pkgbase}-${pkgver}
  autoreconf
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --with-threads \
    --with-history \
    --with-icu \
    --with-python=/usr/bin/python
  make
}

check() {
  cd ${pkgbase}-${pkgver}
  make check
}

package_libxml2()
{
  optdepends=('python: Python bindings')
  provides=(libxml2.so)

  cd ${pkgbase}-${pkgver}
  make DESTDIR="${pkgdir}" install

  mkdir -p ../doc/usr/share
  mv "$pkgdir"/usr/share/{doc,gtk-doc} -t ../doc/usr/share
}

package_libxml2-docs() {
  pkgdesc+=" (documentation)"
  depends=()

  mv doc/* "$pkgdir"
}
