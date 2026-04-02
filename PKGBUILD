# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=orc
pkgver=0.4.42
pkgrel=1
pkgdesc="Optimized Inner Loop Runtime Compiler"
url="https://gstreamer.freedesktop.org/modules/orc.html"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD-3-Clause)
depends=(
  musl
)
makedepends=(
  git
  linux-uapi-headers
  meson
)
# valgrind not available on riscv64 and loongarch64
makedepends_x86_64=(valgrind)
makedepends_aarch64=(valgrind)
source=("git+https://gitlab.freedesktop.org/gstreamer/orc.git#tag=$pkgver")
sha256sums=('a9e88b7f844897812e47ec5aa45698aa4cdd0ab0f38915e28f825a4a00f46434')

build() {
  ewe-meson orc build -Dhotdoc=disabled
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  provides=(liborc{,-test}-${pkgver%.*}.so)

  meson install -C build --destdir "$pkgdir"
  _install_license_ orc/COPYING
}
