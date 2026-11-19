# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kcrash
pkgver=6.32.0
pkgrel=1
pkgdesc='Support for application crash analysis and bug report from apps'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(kcoreaddons qt6-base)
makedepends=(extra-cmake-modules qt6-tools)
optdepends=('drkonqi: KDE crash handler application')
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('fe627df1797fa92a24e53a7f33de07111c7556070028d39f258035a0c3bdb5df')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF \
    -DWITH_X11=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
