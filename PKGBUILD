# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kpty
pkgver=6.9.0
pkgrel=1
pkgdesc='Pty abstraction'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(kcoreaddons
         ki18n
         libutempter
         qt6-base)
makedepends=(extra-cmake-modules
             qt6-tools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('5351b01585adfe9954256d9377fe5d96e0c943aaaeeb78357a238f984304a23d')

prepare() {
  cd $pkgname-$pkgver
  sed -i '1i #define _PATH_UTMP "/var/run/utmp"' src/kpty.cpp
  sed -i '1i #define _PATH_WTMP "/var/log/wtmp"' src/kpty.cpp
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
