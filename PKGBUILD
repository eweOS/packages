# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libavif
pkgver=1.4.2
pkgrel=2
pkgdesc="Library for encoding and decoding .avif files"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/AOMediaCodec/libavif"
license=(LicenseRef-libavif)
depends=(aom dav1d librav1e.so svt-av1 libpng libjpeg-turbo libyuv libwebp)
makedepends=(cmake
             gdk-pixbuf2
             git
             nasm)
source=(git+https://github.com/AOMediaCodec/libavif#tag=v$pkgver)
sha256sums=('2c84afde7ea25afbf3ed9981d65a87723920137e1033f5e4fb48c76c4566ede1')

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DAVIF_BUILD_APPS=ON \
    -DAVIF_BUILD_MAN_PAGES=OFF \
    -DAVIF_CODEC_AOM=SYSTEM \
    -DAVIF_CODEC_DAV1D=SYSTEM \
    -DAVIF_CODEC_RAV1E=SYSTEM \
    -DAVIF_CODEC_SVT=SYSTEM \
    -DAVIF_LIBSHARPYUV=SYSTEM \
    -DAVIF_BUILD_GDK_PIXBUF=ON
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir" install
  install -Dm644 $pkgname/LICENSE -t "${pkgdir}"/usr/share/licenses/$pkgname
}
