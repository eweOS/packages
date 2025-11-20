# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kscreen
pkgver=6.5.2
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
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz no-x11.patch)
sha256sums=('9c814fd42f9730196fc0c9e6230a85bfc8004c0e5732b04879d35db4d7b9c468'
            'd0e152d07288557599d23fdaf1787f5291df625971fa8fbc8ad74a511d2f1711')

prepare() {
  _patch_ $pkgname-$pkgver
}

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
