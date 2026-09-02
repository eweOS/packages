# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libheif
pkgver=1.23.3
pkgrel=1
pkgdesc='An HEIF and AVIF file format decoder and encoder'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/strukturag/libheif'
license=(LGPL-3.0-or-later)
provides=('libheif.so')
makedepends=(cmake
             dav1d
             ffmpeg
             gdk-pixbuf2
             openjpeg2
             libjpeg-turbo
             libpng
             rav1e
             svt-av1)
depends=(aom
         libde265
         libwebp
         openh264
         x264 x265)
optdepends=('libjpeg-turbo: for heif-convert and heif-enc'
            'libpng: for heif-convert and heif-enc'
            'dav1d: dav1d encoder'
            'ffmpeg: hardware decode'
            'rav1e: rav1e encoder'
            'svt-av1: svt-av1 encoder')
source=(
  https://github.com/strukturag/libheif/releases/download/v$pkgver/libheif-$pkgver.tar.gz
)
sha256sums=('11c1179e0e4bec33624b87f22ec42c1e993a40d946d44d26f9c431cf1456a863')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_DAV1D=ON \
    -DWITH_RAV1E=ON \
    -DWITH_FFMPEG_DECODER=ON \
    -DWITH_FFMPEG_DECODER_PLUGIN=ON \
    -DWITH_SvtEnc=ON \
    -DWITH_OpenJPEG_DECODER=ON \
    -DWITH_EXAMPLE_HEIF_THUMB=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
