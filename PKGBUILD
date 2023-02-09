# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=libsigc++
pkgname=libsigc++2
pkgver=2.12.0
pkgrel=1
pkgdesc="Callback Framework for C++"
url="https://libsigcplusplus.github.io/libsigcplusplus/"
arch=(x86_64 aarch64)
license=(LGPL)
makedepends=(meson mm-common)
options=(!emptydirs)
source=("https://github.com/libsigcplusplus/libsigcplusplus/releases/download/$pkgver/$pkgbase-$pkgver.tar.xz")
sha256sums=('SKIP')

build()
{
  ewe-meson $pkgbase-$pkgver build \
    -D maintainer-mode=true \
    -Dbuild-documentation=false
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
