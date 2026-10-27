# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libxml2
pkgver=2.15.4
pkgrel=1
pkgdesc="XML parsing library, version 2"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('MIT')
depends=('zlib' 'ncurses' 'xz')
makedepends=('python')
url="http://www.xmlsoft.org/"
source=(https://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('98087fd181d9070724f3fbc65c7377db03038eb92bd882374daff44940138821')

build()
{
  cd $pkgname-$pkgver
  autoreconf
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --with-threads \
    --with-zlib \
    --with-http \
    --with-history \
    --with-python=/usr/bin/python
  make
}

check() {
  cd $pkgname-$pkgver
  make check
}

package()
{
  optdepends=('python: Python bindings')
  provides=(libxml2.so)

  cd $pkgname-$pkgver
  make DESTDIR="${pkgdir}" install
}
