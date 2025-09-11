# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=freetype2
pkgver=2.14.0
pkgrel=1
pkgdesc="Font rasterization library"
url="https://www.freetype.org/"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL)
depends=(zlib sh libbz2 libpng brotli)
makedepends=(meson)
provides=(libfreetype.so)
source=(https://download-mirror.savannah.gnu.org/releases/freetype/freetype-$pkgver.tar.xz)
sha256sums=('f8dfa8f15ef0576738dfb55b2e6e6b172fd5d09b6f03785a1df03239549f64d2')

build()
{
  ewe-meson freetype-$pkgver build \
    -D freetype2:default_library=shared \
    -D harfbuzz=disabled
  meson compile -C build
}

package()
{
  meson install -C build --destdir="$pkgdir"
  install -Dt "$pkgdir/usr/share/aclocal" -m644 \
    freetype-$pkgver/builds/unix/freetype2.m4
}
