# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libdrm
pkgver=2.4.113
pkgrel=1
pkgdesc="Userspace interface to kernel DRM services"
url="https://dri.freedesktop.org/"
arch=(x86_64 aarch64)
license=('custom')
depends=('libpciaccess')
makedepends=('meson')
source=(https://dri.freedesktop.org/$pkgname/$pkgname-$pkgver.tar.xz COPYING)
sha256sums=('SKIP' 'SKIP')

build()
{
  ewe-meson $pkgname-$pkgver build \
    -D udev=false \
    -D etnaviv=disabled \
    -D freedreno=disabled \
    -D vc4=disabled \
    -D valgrind=disabled \
    -D cairo-tests=disabled \
    -D man-pages=disabled
  meson compile -C build
}

package()
{
  meson install -C build --destdir "$pkgdir"
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 COPYING
}
