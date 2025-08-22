# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=baloo
pkgver=6.17.0
pkgrel=1
pkgdesc='A framework for searching and managing metadata'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(llvm-libs
         musl
         kconfig
         kcoreaddons
         kcrash
         kdbusaddons
         kfilemetadata
         ki18n
         kidletime
         kio
         lmdb
         qt6-base
         solid)
makedepends=(extra-cmake-modules
             kdoctools
             qt6-tools)
optdepends=('qt6-declarative: QML bindings')
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('21aac3e95ea095df029bbe0bd5663aa398a8894e9c31ea7fabb5cd0b9848544a')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBEXECDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  rm -r $pkgdir/usr/lib/systemd
}
