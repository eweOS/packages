# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=extra-cmake-modules
pkgver=6.9.0
pkgrel=1
pkgdesc='Extra modules and scripts for CMake'
arch=(any)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(cmake)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz
	detect-eweOS.patch)
sha256sums=('cec06b25e166edb71a1a973641c4f5fc3c8712dde3fb3e639db586515cc1642e'
            '9c4168e52667c6b4fcd4b39869480a401da5f13af8c4fbd5d747b3c670a85af0')

prepare() {
	_patch_ $pkgname-$pkgver
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
