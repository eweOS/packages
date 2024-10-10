# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libavif
pkgver=1.1.1
pkgrel=1
pkgdesc="Library for encoding and decoding .avif files"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/AOMediaCodec/libavif"
license=(LicenseRef-libavif)
depends=(aom dav1d librav1e.so svt-av1 libpng libjpeg-turbo libyuv libwebp)
makedepends=(cmake
             gdk-pixbuf2
             git
             nasm)
source=(git+https://github.com/AOMediaCodec/libavif#tag=v$pkgver)
sha256sums=('2868a336117886bd3b4094e8c48589e67152ae8f39b06c067f8c51ec2709f577')

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DAVIF_BUILD_APPS=ON \
    -DAVIF_BUILD_MAN_PAGES=OFF \
    -DAVIF_CODEC_AOM=ON \
    -DAVIF_CODEC_DAV1D=ON \
    -DAVIF_CODEC_RAV1E=ON \
    -DAVIF_CODEC_SVT=ON \
    -DAVIF_LIBSHARPYUV=SYSTEM \
    -DAVIF_BUILD_GDK_PIXBUF=ON
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir" install
  install -Dm644 $pkgname/LICENSE -t "${pkgdir}"/usr/share/licenses/$pkgname
}
