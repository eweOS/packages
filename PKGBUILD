# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kdoctools
pkgver=6.9.0
pkgrel=1
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
sha256sums=('6cc43f7db6df703cde1c6fbb24debcfb11c3df8f176be101577e21582d0209ca')

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
