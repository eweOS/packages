# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=prison
pkgver=6.32.0
pkgrel=1
pkgdesc='A library to produce QRCode barcodes and DataMatrix barcodes'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(MIT)
depends=(libdmtx
         llvm-libs
         musl
         qrencode
         qt6-base
         qt6-multimedia
         zxing-cpp)
makedepends=(extra-cmake-modules
             qt6-declarative
             qt6-tools)
optdepends=('qt6-declarative: QML bindings')
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('13d904f7514ffe32e49fe09a2b5e10125f825d42c26ee52294c15ce1bfab3970')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
