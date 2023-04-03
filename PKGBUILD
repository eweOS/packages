# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=freetype2
pkgver=2.12.1
pkgrel=1
pkgdesc="Font rasterization library"
url="https://www.freetype.org/"
arch=(x86_64 aarch64)
license=(GPL)
depends=(zlib sh libbz2 libpng brotli)
makedepends=(meson)
source=(https://download-mirror.savannah.gnu.org/releases/freetype/freetype-$pkgver.tar.xz)
sha256sums=('4766f20157cc4cf0cd292f80bf917f92d1c439b243ac3018debf6b9140c41a7f')

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
