# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=extra-cmake-modules
pkgver=6.1.0
pkgrel=2
pkgdesc='Extra modules and scripts for CMake'
arch=(any)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(cmake)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz
	detect-eweOS.patch)
sha256sums=('76c9edf00807e6cf8d4ae35f5195b4bc3fe94648d976fef532bf7f97d86388bd'
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
