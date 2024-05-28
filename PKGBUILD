# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libzip
pkgver=1.10.1
pkgrel=2
pkgdesc="C library for reading, creating, and modifying zip archives"
url="https://libzip.org"
license=('BSD')
arch=('x86_64' 'aarch64' 'riscv64')
depends=('zlib' 'libbz2' 'zstd' 'openssl')
makedepends=('cmake')
provides=('libzip.so')
source=("${url}/download/${pkgname}-${pkgver}.tar.xz")
sha256sums=('dc3c8d5b4c8bbd09626864f6bcf93de701540f761d76b85d7c7d710f4bd90318')

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
