# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=syntax-highlighting
pkgver=6.26.0
pkgrel=1
pkgdesc='Syntax highlighting engine for structured text and code'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(MIT)
depends=(qt6-base)
makedepends=(extra-cmake-modules
             qt6-declarative
             qt6-tools)
optdepends=('qt6-declarative: QML bindings')
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('a4e86d167cd5f3c4318584119451f891551c24cd4a0ff1f7ef95e2476a39c5ac')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DQRC_SYNTAX=OFF \
    -DBUILD_QCH=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
