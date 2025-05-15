# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kcrash
pkgver=6.14.0
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
sha256sums=('69d736be73bbe4a936f8996c3591a53c16816d4396d242d2e63dce079a268c34')

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
