# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libayatana-appindicator
pkgver=0.5.94
pkgrel=1
pkgdesc='Ayatana Application Indicators shared library'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/AyatanaIndicators/libayatana-appindicator'
license=(LGPL2.1 LGPL3)
depends=(glib2
         gtk3
         libayatana-indicator
         libdbusmenu-glib
         libdbusmenu-gtk3)
makedepends=(cmake
             gobject-introspection
             vala)
source=(https://github.com/AyatanaIndicators/$pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('884a6bc77994c0b58c961613ca4c4b974dc91aa0f804e70e92f38a542d0d0f90')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_BINDINGS_MONO=OFF \
    -DENABLE_GTKDOC=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
