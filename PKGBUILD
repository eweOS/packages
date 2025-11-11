# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cairomm
pkgver=1.18.0
pkgrel=3
pkgdesc="C++ bindings for Cairo"
url="https://www.cairographics.org/cairomm/"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL-2.0-or-later)
depends=(musl llvm-libs cairo libsigc++3)
makedepends=(meson mm-common)
source=("https://gitlab.freedesktop.org/cairo/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('a0444ba4223905b1f8280aaff0f6c548971b95e9e1ab58fe9759bb131e710ecb')

build() {
  ewe-meson $pkgname-$pkgver build \
    -D maintainer-mode=true \
    -D build-documentation=false
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
