# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kdoctools
pkgver=6.6.0
pkgrel=2
pkgdesc='Documentation generation from docbook'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(docbook-xsl
         karchive
         libxml2
         libxslt
         qt6-base)
makedepends=(extra-cmake-modules
             ki18n
             perl-uri
             qt6-tools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('149e0b442290f8bc9d2a0c99c8e27a5735a3a83870a82de007e487529f0aad44')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF \
    -DDocBookXSL_DIR=/usr/share/xml/docbook/xsl-stylesheets-1.79.2-nons
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
