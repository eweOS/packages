# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=freetype2
pkgver=2.14.2
pkgrel=1
pkgdesc="Font rasterization library"
url="https://www.freetype.org/"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL)
depends=(zlib sh libbz2 libpng brotli)
makedepends=(meson)
provides=(libfreetype.so)
source=(https://download-mirror.savannah.gnu.org/releases/freetype/freetype-$pkgver.tar.xz)
sha256sums=('4b62dcab4c920a1a860369933221814362e699e26f55792516d671e6ff55b5e1')

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
