# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libzip
pkgver=1.11.4
pkgrel=1
pkgdesc="C library for reading, creating, and modifying zip archives"
url="https://libzip.org"
license=('BSD')
arch=(x86_64 aarch64 riscv64 loongarch64)
depends=('zlib' 'libbz2' 'zstd' 'openssl')
makedepends=('cmake')
provides=('libzip.so')
source=("${url}/download/${pkgname}-${pkgver}.tar.xz")
sha256sums=('8a247f57d1e3e6f6d11413b12a6f28a9d388de110adc0ec608d893180ed7097b')

build() {
  cmake -B build -S ${pkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 ${pkgname}-${pkgver}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
