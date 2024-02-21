# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pixman
pkgver=0.43.2
pkgrel=1
pkgdesc="The pixel-manipulation library for X and cairo"
arch=(x86_64 aarch64 riscv64)
url="https://cgit.freedesktop.org/pixman/"
license=('custom')
depends=('musl')
makedepends=('meson' 'libpng')
provides=('libpixman-1.so')
source=(https://xorg.freedesktop.org/releases/individual/lib/${pkgname}-${pkgver}.tar.xz)
sha512sums=('1a1d21b86b3c6784c4c2606b7069723b4dbb747eac9fce95bca86516787840379ffd49abc42d11e7143e85c32c85496f33c2562c7a910ca6f963599affdc3224')

_arglist=(
    -Dloongson-mmi=disabled
    -Dvmx=disabled
    -Darm-simd=disabled
    -Da64-neon=disabled
    -Dneon=disabled
    -Diwmmxt=disabled
    -Dopenmp=disabled
    -Dmips-dspr2=disabled
    -Dgtk=disabled    
)

build()
{
  case $CARCH in
    aarch64)
      _arglist+=("-Dmmx=disabled")
      _arglist+=("-Dsse2=disabled")
      _arglist+=("-Dssse3=disabled")
      ;;
    riscv64)
      _arglist+=("-Dmmx=disabled")
      _arglist+=("-Dsse2=disabled")
      _arglist+=("-Dssse3=disabled")
      ;;
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
