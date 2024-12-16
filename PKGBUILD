# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=ki18n
pkgver=6.9.0
pkgrel=1
pkgdesc='Advanced internationalization framework'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(iso-codes qt6-base)
makedepends=(extra-cmake-modules
             python
             qt6-declarative
             qt6-tools)
optdepends=('python: to compile .ts files'
            'qt6-declarative: ktranscript plugin and QML bindings')
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('736ae10e3a8c5dced155d3347f9dbd91c34f485d7495815f85f4d624681a1860')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
