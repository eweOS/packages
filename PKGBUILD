# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libglvnd
pkgver=1.6.0
pkgrel=1
pkgdesc="The GL Vendor-Neutral Dispatch library"
arch=('x86_64' 'aarch64')
url="https://gitlab.freedesktop.org/glvnd/libglvnd"
license=('BSD')
makedepends=('python' 'meson')
depends=('mesa')
provides=('libgl' 'libegl' 'libgles')
source=("$url/-/archive/v$pkgver/libglvnd-v$pkgver.tar.gz")
sha512sums=('SKIP')

build()
{
  ewe-meson $pkgname-v$pkgver build \
    -D x11=disabled \
    -D glx=disabled \
    -D gles1=false
  meson compile -C build
}

package()
{
  meson install -C build --destdir "$pkgdir"
}
