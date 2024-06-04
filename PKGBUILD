# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=sdl2-image
pkgver=2.8.2
pkgrel=1
pkgdesc="A simple library to load images of various formats as SDL surfaces (Version 2)"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/libsdl-org/SDL_image"
license=('MIT')
depends=('sdl2' 'libpng' 'libtiff' 'libjpeg' 'libwebp')
makedepends=('cmake')
provides=(sdl2_image)
options=(!lto)
source=("https://github.com/libsdl-org/SDL_image/releases/download/release-${pkgver}/SDL2_image-${pkgver}.tar.gz")
sha256sums=('8f486bbfbcf8464dd58c9e5d93394ab0255ce68b51c5a966a918244820a76ddc')

build() {
  cd "${srcdir}/SDL2_image-${pkgver}/"
  # FIXME: add avif and jxl support
  ./configure --disable-static --prefix=/usr \
    --disable-avif \
    --disable-jxl \
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
  cd "${srcdir}/SDL2_image-${pkgver}/"

  make DESTDIR="${pkgdir}/" install
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
