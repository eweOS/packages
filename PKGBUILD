# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=extra-cmake-modules
pkgver=6.20.0
pkgrel=1
pkgdesc='Extra modules and scripts for CMake'
arch=(any)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(cmake)
makedepends=(qt6-tools)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz
	detect-eweOS.patch)
sha256sums=('3711de8572db5da618efe3f28cc094ca25a1abb0bddffc63dced12c4f8caae5f'
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
