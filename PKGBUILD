# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=solid
pkgver=6.15.0
pkgrel=1
pkgdesc='Hardware integration and detection'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(qt6-base
         util-linux-libs)
makedepends=(extra-cmake-modules
	     linux-headers
             qt6-declarative
             qt6-tools)
optdepends=('qt5-declarative: QML bindings')
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('608b2d3ad987369718a2fe8a5fa7b71c75faa51a20eaff5ba6b0edf0e5ebbb4a')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF \
    -DWITH_NEW_POWER_ASYNC_API=ON \
    -DWITH_NEW_POWER_ASYNC_FREEDESKTOP=ON \
    -DWITH_NEW_SOLID_JOB=ON # https://bugs.archlinux.org/task/64093
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

