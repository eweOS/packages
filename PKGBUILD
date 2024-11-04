# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libzip
pkgver=1.11.2
pkgrel=1
pkgdesc="C library for reading, creating, and modifying zip archives"
url="https://libzip.org"
license=('BSD')
arch=(x86_64 aarch64 riscv64 loongarch64)
depends=('zlib' 'libbz2' 'zstd' 'openssl')
makedepends=('cmake')
provides=('libzip.so')
source=("${url}/download/${pkgname}-${pkgver}.tar.xz")
sha256sums=('5d471308cef4c4752bbcf973d9cd37ba4cb53739116c30349d4764ba1410dfc1')

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
