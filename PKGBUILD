# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=libjpeg-turbo
pkgname=libjpeg
pkgver=3.0.2
pkgrel=1
pkgdesc="JPEG image codec with accelerated baseline compression and decompression"
url="https://libjpeg-turbo.org/"
arch=(x86_64 aarch64 riscv64)
license=(BSD)
makedepends=(cmake ninja nasm)
source=(https://github.com/libjpeg-turbo/$pkgbase/releases/download/$pkgver/$pkgbase-$pkgver.tar.gz)
sha256sums=('c2ce515a78d91b09023773ef2770d6b0df77d674e144de80d63e0389b3a15ca6')

build() {
  cmake -S $pkgbase-$pkgver -B build -G Ninja \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DCMAKE_BUILD_TYPE=None \
        -DENABLE_STATIC=OFF \
        -DWITH_JPEG8=ON \
        -W no-dev \
        -B build \
        -S $pkgbase-$pkgver
  cmake --build build -v
}

check() {
  cd build
  ctest --output-on-failure --stop-on-failure -j$(nproc)
}

package() {
  DESTDIR="$pkgdir" cmake --install build -v
  install -vDm 644 $pkgbase-$pkgver/LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
}
