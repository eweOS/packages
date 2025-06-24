# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kdoctools
pkgver=6.15.0
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
sha256sums=('430be5905b0bf6dfb4b7e0e2c0aeb75986eef0a30f13320d9d4cab907fd6bef7')

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
