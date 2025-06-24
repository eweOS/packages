# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kservice
pkgver=6.15.0
pkgrel=1
pkgdesc='Advanced plugin and service introspection'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(kconfig
         kcoreaddons
         ki18n
         qt6-base)
makedepends=(extra-cmake-modules
             qt6-tools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('c371bfe6e25e965bf4dce1f1e42c84c2f68997ed49dc19bdbc6419478235269d')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

