# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libzip
pkgver=1.11.1
pkgrel=1
pkgdesc="C library for reading, creating, and modifying zip archives"
url="https://libzip.org"
license=('BSD')
arch=('x86_64' 'aarch64' 'riscv64')
depends=('zlib' 'libbz2' 'zstd' 'openssl')
makedepends=('cmake')
provides=('libzip.so')
source=("${url}/download/${pkgname}-${pkgver}.tar.xz")
sha256sums=('721e0e4e851073b508c243fd75eda04e4c5006158a900441de10ce274cc3b633')

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
