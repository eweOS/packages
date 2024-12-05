# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libheif
pkgver=1.19.5
pkgrel=3
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
sha256sums=('d3cf0a76076115a070f9bc87cf5259b333a1f05806500045338798486d0afbaf')

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
