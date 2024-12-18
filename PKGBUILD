# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libayatana-indicator
pkgver=0.9.4
pkgrel=1
pkgdesc='Ayatana Indicators shared library'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/AyatanaIndicators/libayatana-indicator'
license=(LGPL2.1 LGPL3)
depends=(ayatana-ido
         gdk-pixbuf2
         glib2
         gtk3)
makedepends=(cmake
             gobject-introspection
             vala)
source=(https://github.com/AyatanaIndicators/$pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('a18d3c682e29afd77db24366f8475b26bda22b0e16ff569a2ec71cd6eb4eac95')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBEXECDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
