# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=sdl2-image
pkgver=2.8.12
pkgrel=2
pkgdesc="A simple library to load images of various formats as SDL surfaces (Version 2)"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/libsdl-org/SDL_image"
license=('MIT')
depends=('sdl2' 'libpng' 'libtiff' 'libjpeg' 'libwebp' 'libjxl' 'libavif')
makedepends=('cmake')
provides=(sdl2_image)
options=(!lto)
source=("https://github.com/libsdl-org/SDL_image/releases/download/release-${pkgver}/SDL2_image-${pkgver}.tar.gz")
sha256sums=('393f5efb50536ec13ca4f4affb69cc9966d3c3f969e6c5e701faddf9f9785381')

prepare() {
  cd "$srcdir/SDL2_image-$pkgver"
  autoreconf -fiv
}

build() {
  cd "$srcdir/SDL2_image-$pkgver"
  ./configure --disable-static --prefix=/usr \
    --disable-avif-shared \
    --disable-jpg-shared \
    --disable-png-shared \
    --disable-stb-image \
    --disable-tif-shared \
    --disable-jxl-shared \
    --disable-webp-shared
  make
}

package() {
  cd "$srcdir/SDL2_image-$pkgver"

  make DESTDIR="$pkgdir" install
  _install_license_ LICENSE.txt
}
