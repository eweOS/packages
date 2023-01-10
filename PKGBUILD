# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pixman
pkgver=0.40.0
pkgrel=1
pkgdesc="The pixel-manipulation library for X and cairo"
arch=(x86_64 aarch64)
url="https://cgit.freedesktop.org/pixman/"
license=('custom')
depends=('musl')
makedepends=('meson' 'libpng')
provides=('libpixman-1.so')
source=(https://xorg.freedesktop.org/releases/individual/lib/${pkgname}-${pkgver}.tar.xz)
sha512sums=('SKIP')

build()
{
  ewe-meson $pkgbase-$pkgver build \
    -D loongson-mmi=disabled \
    -D vmx=disabled \
    -D arm-simd=disabled \
    -D neon=disabled \
    -D iwmmxt=disabled \
    -D openmp=disabled \
    -D mips-dspr2=disabled \
    -D gtk=disabled
  ninja -C build
}

package()
{
  DESTDIR="$pkgdir" meson install -C build
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $pkgname-$pkgver/COPYING
}
