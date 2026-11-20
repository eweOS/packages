# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=knighttime
pkgver=6.8.3
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='Helpers for scheduling the dark-light cycle'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(llvm-libs
         musl
         kconfig
         kcoreaddons
         kdbusaddons
         kholidays
         qt6-base
         qt6-positioning)
makedepends=(extra-cmake-modules
             ki18n
             qt6-tools)
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz)
sha256sums=('b364a57af1a629d5e09c36a3c859075f8eafa2463201959548fbc362987d7c5f')

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBEXECDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  # user service: plasma-knighttimed.service (also on dbus)
  rm -r $pkgdir/usr/lib/systemd
}
