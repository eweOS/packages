# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=libsigc++
pkgname=libsigc++3
pkgver=3.6.0
pkgrel=1
pkgdesc="Callback Framework for C++"
url="https://libsigcplusplus.github.io/libsigcplusplus/"
arch=(x86_64 aarch64 riscv64)
license=(LGPL)
makedepends=(meson mm-common)
options=(!emptydirs)
source=("https://github.com/libsigcplusplus/libsigcplusplus/releases/download/$pkgver/$pkgbase-$pkgver.tar.xz")
sha256sums=('c3d23b37dfd6e39f2e09f091b77b1541fbfa17c4f0b6bf5c89baef7229080e17')

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
