# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libzip
pkgver=1.12.1
pkgrel=1
pkgdesc="C library for reading, creating, and modifying zip archives"
url="https://libzip.org"
license=('BSD')
arch=(x86_64 aarch64 riscv64 loongarch64)
depends=('zlib' 'libbz2' 'zstd' 'openssl')
makedepends=('cmake')
provides=('libzip.so')
source=("${url}/download/${pkgname}-${pkgver}.tar.xz")
sha256sums=('c40062022a1963c80573d48f6070792297cecd7c6bffe3aefcac0d8b9bee8913')

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
