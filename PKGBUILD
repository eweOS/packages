# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pixman
pkgver=0.46.4
pkgrel=1
pkgdesc="The pixel-manipulation library for X and cairo"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://cgit.freedesktop.org/pixman/"
license=('custom')
depends=('musl')
makedepends=('meson' 'libpng')
provides=('libpixman-1.so')
source=(https://xorg.freedesktop.org/releases/individual/lib/${pkgname}-${pkgver}.tar.xz)
sha512sums=('83b133e7969ba34f883f4e08dcc5d388c4397f43ce836c191c05945fe77c16ff501d531600780c12678a0d08105828a6bdeff2156b63f9c1a84087bc7f40ae9f')

_arglist=(
    -Dloongson-mmi=disabled
    -Dvmx=disabled
    -Darm-simd=disabled
    -Da64-neon=disabled
    -Dneon=disabled
    -Drvv=disabled
    -Dopenmp=disabled
    -Dmips-dspr2=disabled
    -Dgtk=disabled
)

build()
{
  case $CARCH in
    aarch64|riscv64|loongarch64)
      _arglist+=("-Dmmx=disabled")
      _arglist+=("-Dsse2=disabled")
      _arglist+=("-Dssse3=disabled")
  esac
  ewe-meson $pkgbase-$pkgver build \
    "${_arglist[@]}"
  ninja -C build
}

package()
{
  DESTDIR="$pkgdir" meson install -C build
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $pkgname-$pkgver/COPYING
}
