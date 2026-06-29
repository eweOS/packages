# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libayatana-indicator
pkgver=0.9.5
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
sha256sums=('73d71c908b803f12e4a5ecd8392511b58afbdd0c82ad7909611a17bb7847c5c8')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBEXECDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
