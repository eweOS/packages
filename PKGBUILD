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
sha512sums=('8b8be80d94da7d9ffe58dccbcd5bd8079e86326a3a1a880ff1f7bf6f2d74eb5143cd3783fc2d8119fed597b3376e33f34ed889cc2259073dfd1d6c985a739df6')

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
