# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libheif
pkgver=1.19.7
pkgrel=1
pkgdesc='An HEIF and AVIF file format decoder and encoder'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/strukturag/libheif'
license=(GPL3)
provides=('libheif.so')
makedepends=(cmake
             dav1d
             ffmpeg
             gdk-pixbuf2
             libjpeg-turbo
             libpng
             rav1e
             svt-av1)
depends=(aom
         libde265
         libwebp
         x265)
optdepends=('libjpeg-turbo: for heif-convert and heif-enc'
            'libpng: for heif-convert and heif-enc'
            'dav1d: dav1d encoder'
            'ffmpeg: hardware decode'
            'rav1e: rav1e encoder'
            'svt-av1: svt-av1 encoder')
source=(
  https://github.com/strukturag/libheif/releases/download/v$pkgver/libheif-$pkgver.tar.gz
)
sha256sums=('161c042d2102665fcee3ded851c78a0eb5f2d4bfe39fba48ba6e588fd6e964f3')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_DAV1D=ON \
    -DWITH_RAV1E=ON \
    -DWITH_FFMPEG_DECODER=ON \
    -DWITH_FFMPEG_DECODER_PLUGIN=ON \
    -DWITH_SvtEnc=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
