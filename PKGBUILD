# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libxmlb
pkgver=0.3.28
pkgrel=1
pkgdesc="Library to help create and query binary XML blobs"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/hughsie/libxmlb"
license=(LGPL)
depends=(xz zstd)
makedepends=(meson gobject-introspection)
checkdepends=(shared-mime-info)
source=("https://github.com/hughsie/libxmlb/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('5982b4fe344deb36e57b40d7582f594ecd9414f86fb8258bb56f8b1a38e1d527')

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

