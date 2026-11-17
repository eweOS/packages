# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=orc
pkgver=0.4.44
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
sha256sums=('285cadbcd17a8837a4b3f7d3f5052b2f7ce6fdb3b8f1a2e10288a93a2760f006')

build() {
  # FIXME: Testcases fail with -Os and above when compiled with Clang 20.
  #	   Remove this work around after upgrading Clang/LLVM.
  [ "$CARCH" = "loongarch64" ] && export CFLAGS="-O1"

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
