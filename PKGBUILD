# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=ki18n
pkgver=6.20.0
pkgrel=2
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
sha256sums=('f29c805137af9cee6abab424b380fea964a59b089f90fb909601d9fc78df5f73')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
