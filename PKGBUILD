# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=freetype2
pkgver=2.15.0
pkgrel=1
pkgdesc="Font rasterization library"
url="https://www.freetype.org/"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('FTL OR GPL-2.0-or-later')
depends=(zlib sh libbz2 libpng brotli)
makedepends=(meson)
provides=(libfreetype.so)
source=(https://download-mirror.savannah.gnu.org/releases/freetype/freetype-$pkgver.tar.xz)
sha256sums=('93cd47eb719c325107f2d3cf087d06299e944c3b48a40b55537302304dea1dd5')

build()
{
  # HVF support is available only on Apple platforms.
  ewe-meson freetype-$pkgver build \
    -D freetype2:default_library=shared \
    -D harfbuzz=disabled \
    -D hvf=disabled
  meson compile -C build
}

package()
{
  meson install -C build --destdir="$pkgdir"
  _install_license_ "$srcdir/freetype-$pkgver/LICENSE.TXT" LICENSE.TXT
  _install_license_ "$srcdir/freetype-$pkgver/docs/FTL.TXT" FTL.TXT
  _install_license_ "$srcdir/freetype-$pkgver/docs/GPLv2.TXT" GPLv2.TXT
  install -Dt "$pkgdir/usr/share/aclocal" -m644 \
    freetype-$pkgver/builds/unix/freetype2.m4
}
