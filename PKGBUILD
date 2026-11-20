# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kscreen
pkgver=6.8.3
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='KDE screen management software'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(llvm-libs
         musl
         kcmutils
         kconfig
         kcoreaddons
         kdbusaddons
         ki18n
         kirigami
         kitemmodels
         ksvg
         kwindowsystem
         layer-shell-qt
         libkscreen
         libplasma
         plasma5support
         qt6-base
         qt6-declarative
         qt6-sensors
         qt6-wayland
         wayland)
makedepends=(extra-cmake-modules
             qt6-base-devel
             wayland-protocols)
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz)
sha256sums=('866dead8b6bb3f974a64f18c930e219b358118213e510fcdaabafc37ee7a8a73')

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DWITH_X11=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  rm -r $pkgdir/usr/lib/systemd
}
