# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=freetype2
pkgver=2.13.1
pkgrel=1
pkgdesc="Font rasterization library"
url="https://www.freetype.org/"
arch=(x86_64 aarch64 riscv64)
license=(GPL)
depends=(zlib sh libbz2 libpng brotli)
makedepends=(meson)
source=(https://download-mirror.savannah.gnu.org/releases/freetype/freetype-$pkgver.tar.xz)
sha256sums=('ea67e3b019b1104d1667aa274f5dc307d8cbd606b399bc32df308a77f1a564bf')

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
