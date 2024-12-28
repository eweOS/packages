# Maintainer: Yukari Chiba <i@0x7f.cc>

_pkgbase=libjpeg-turbo
pkgbase=libjpeg
pkgname=libjpeg
pkgver=3.1.0
pkgrel=1
pkgdesc="JPEG image codec with accelerated baseline compression and decompression"
url="https://libjpeg-turbo.org/"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(
  BSD-3-Clause
  IJG
)
provides=(
  libjpeg
  libjpeg.so
  libturbojpeg.so
  libjpeg-turbo
)
makedepends=(cmake ninja nasm)
source=(https://github.com/libjpeg-turbo/${_pkgbase}/releases/download/$pkgver/${_pkgbase}-$pkgver.tar.gz)
sha256sums=('9564c72b1dfd1d6fe6274c5f95a8d989b59854575d4bbee44ade7bc17aa9bc93')

build() {
  cmake -S ${_pkgbase}-$pkgver -B build -G Ninja \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DCMAKE_BUILD_TYPE=None \
        -DENABLE_STATIC=OFF \
        -DWITH_JPEG8=ON \
        -W no-dev \
        -B build \
        -S ${_pkgbase}-$pkgver
  cmake --build build -v
}

check() {
  cd build
  ctest --output-on-failure --stop-on-failure -j$(nproc)
}

package() {
  DESTDIR="$pkgdir" cmake --install build -v

  # header required by some dependents
  # https://bugs.archlinux.org/task/24787
  install -vDm 644 ${_pkgbase}-$pkgver/src/jpegint.h "$pkgdir/usr/include"

  install -vDm 644 ${_pkgbase}-$pkgver/LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 ${_pkgbase}-$pkgver/README.ijg -t "$pkgdir/usr/share/licenses/$pkgname/"
}
