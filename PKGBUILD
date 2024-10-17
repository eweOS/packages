# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xmlto
pkgver=0.0.29
pkgrel=2
pkgdesc="Convert xml to many other formats"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://pagure.io/xmlto/"
license=('GPL-2.0-or-later')
depends=('libxslt')
makedepends=('docbook-xsl')
source=("https://releases.pagure.org/xmlto/$pkgname-$pkgver.tar.bz2")
sha256sums=('6000d8e8f0f9040426c4f85d7ad86789bc88d4aeaef585c4d4110adb0b214f21')

prepare() {
  cd "$pkgname-$pkgver"
  autoreconf -iv
}

build() {
  cd "$pkgname-$pkgver"
  ./configure BASH=/bin/bash \
    --prefix=/usr \
    --mandir=/usr/share/man
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
