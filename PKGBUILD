# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pixman
pkgver=0.46.2
pkgrel=1
pkgdesc="The pixel-manipulation library for X and cairo"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://cgit.freedesktop.org/pixman/"
license=('custom')
depends=('musl')
makedepends=('meson' 'libpng')
provides=('libpixman-1.so')
source=(https://xorg.freedesktop.org/releases/individual/lib/${pkgname}-${pkgver}.tar.xz)
sha512sums=('9419e5a23f4b709e075c5dd33c46bb375d2407b6e90623fe3410a03171f4c5e0a511e8b4414557a39b68d46a4c1ac64f2ef0c9c6eab0b42a2be75d5d52a367fd')

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
