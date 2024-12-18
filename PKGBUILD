# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=ayatana-ido
pkgver=0.10.4
pkgrel=1
pkgdesc='Ayatana Indicator Display Objects'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/AyatanaIndicators/ayatana-ido'
license=(LGPL-2.1-or-later
         LGPL-3.0-or-later)
depends=(cairo
         gdk-pixbuf2
         glib2
         gtk3
         pango)
makedepends=(cmake
             git
             gtest
             gobject-introspection
             vala)
source=(git+https://github.com/AyatanaIndicators/$pkgname#tag=$pkgver)
sha256sums=('7358770ad5aca5d8a2c389a48c83a9f694ddd28034390da7042277d5c92a6538')

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr  
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
