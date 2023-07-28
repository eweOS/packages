# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=libsigc++
pkgname=libsigc++3
pkgver=3.4.0
pkgrel=1
pkgdesc="Callback Framework for C++"
url="https://libsigcplusplus.github.io/libsigcplusplus/"
arch=(x86_64 aarch64 riscv64)
license=(LGPL)
makedepends=(meson mm-common)
options=(!emptydirs)
source=("https://github.com/libsigcplusplus/libsigcplusplus/releases/download/$pkgver/$pkgbase-$pkgver.tar.xz")
sha256sums=('02e2630ffb5ce93cd52c38423521dfe7063328863a6e96d41d765a6116b8707e')

build()
{
  ewe-meson $pkgbase-$pkgver build \
    -D maintainer-mode=true \
    -D build-documentation=false
  meson compile -C build
}

check()
{
  meson test -C build --print-errorlogs
}

package()
{
  meson install -C build --destdir "$pkgdir"
}
