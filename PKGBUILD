# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cairomm-gtk3
_pkgname=cairomm
pkgver=1.14.6
pkgrel=1
pkgdesc="C++ bindings for Cairo"
url="https://www.cairographics.org/cairomm/"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL MPL)
depends=(cairo libsigc++2)
makedepends=(meson mm-common)
options=(!emptydirs)
source=("https://gitlab.freedesktop.org/cairo/$_pkgname/-/archive/$pkgver/$_pkgname-$pkgver.tar.bz2")
sha256sums=('90e7304f6c780aaaab23c08f335710d62d0a40be440381732fd7e15550e6e3e8')

build() {
  ewe-meson $_pkgname-$pkgver build \
    -D maintainer-mode=true \
    -D build-documentation=false
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
