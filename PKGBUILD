# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=libjpeg-turbo
pkgname=libjpeg
pkgver=2.1.5.1
pkgrel=2
pkgdesc="JPEG image codec with accelerated baseline compression and decompression"
url="https://libjpeg-turbo.org/"
arch=(x86_64 aarch64)
license=(BSD)
makedepends=(cmake ninja nasm)
source=(https://sourceforge.net/projects/$pkgbase/files/$pkgver/$pkgbase-$pkgver.tar.gz)
sha256sums=('2fdc3feb6e9deb17adec9bafa3321419aa19f8f4e5dea7bf8486844ca22207bf')

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
