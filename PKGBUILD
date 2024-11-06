# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pixman
pkgver=0.44.0
pkgrel=1
pkgdesc="The pixel-manipulation library for X and cairo"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://cgit.freedesktop.org/pixman/"
license=('custom')
depends=('musl')
makedepends=('meson' 'libpng')
provides=('libpixman-1.so')
source=(https://xorg.freedesktop.org/releases/individual/lib/${pkgname}-${pkgver}.tar.xz)
sha512sums=('3ea293cd308a4faeb600939df2c98148154cf1faf8e435b9f33df46c33acfeb32572cb0c1e148ee9f6f39f9e8a49fbda627edcac03da2000d89e22941849a04d')

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
