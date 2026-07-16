# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=extra-cmake-modules
pkgver=6.28.0
pkgrel=1
pkgdesc='Extra modules and scripts for CMake'
arch=(any)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(cmake)
makedepends=(qt6-tools)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz
	detect-eweOS.patch)
sha256sums=('a32e24b267e8528d0253bc8df18bdc00e676560a43b796533e1b1406f4eef4db'
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
