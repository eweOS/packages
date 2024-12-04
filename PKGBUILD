# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pixman
pkgver=0.44.2
pkgrel=1
pkgdesc="The pixel-manipulation library for X and cairo"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://cgit.freedesktop.org/pixman/"
license=('custom')
depends=('musl')
makedepends=('meson' 'libpng')
provides=('libpixman-1.so')
source=(https://xorg.freedesktop.org/releases/individual/lib/${pkgname}-${pkgver}.tar.xz)
sha512sums=('b24907f9a0bf6a9aa3278d31986c562c5f2d68f8c178021497c8648aca9f91e4c6f1ecfacf93eb01ba4f03ce4cfc5970fc40bb0fe6724bac9210fc57da09cba4')

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
