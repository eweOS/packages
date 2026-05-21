# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=syntax-highlighting
pkgver=6.20.0
pkgrel=2
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
sha256sums=('6e2862a3857c11e9a75accc6e3acfcc16f634ee878586b4d2a97b573f52bfdc0')

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
