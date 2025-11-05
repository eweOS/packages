# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=freetype2
pkgver=2.14.1
pkgrel=1
pkgdesc="Font rasterization library"
url="https://www.freetype.org/"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL)
depends=(zlib sh libbz2 libpng brotli)
makedepends=(meson)
provides=(libfreetype.so)
source=(https://download-mirror.savannah.gnu.org/releases/freetype/freetype-$pkgver.tar.xz)
sha256sums=('32427e8c471ac095853212a37aef816c60b42052d4d9e48230bab3bdf2936ccc')

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
