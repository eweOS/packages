# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libxmlb
pkgver=0.3.15
pkgrel=1
pkgdesc="Library to help create and query binary XML blobs"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/hughsie/libxmlb"
license=(LGPL)
depends=(xz zstd)
makedepends=(meson gobject-introspection)
checkdepends=(shared-mime-info)
source=("https://github.com/hughsie/libxmlb/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('4cf605965d0e669db737da6443314664ea471807f2719a84550f2490670beea9')

build() {
  ewe-meson ${pkgname}-${pkgver} build -D gtkdoc=false
  ninja -v -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "${pkgdir}"
  rm -r "${pkgdir}"/usr/{lib,share}/installed-tests/
}

