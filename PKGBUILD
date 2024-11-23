# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libkscreen
pkgver=6.1.5
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='KDE screen management software'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(qt6-base
         qt6-wayland
         wayland)
makedepends=(extra-cmake-modules
             plasma-wayland-protocols
             qt6-tools)
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz no-x11.patch)
sha256sums=('58f523a9dfe07a5cb9758d60f6a7f1c9f40120289f835515a4e2d8d6d6da4c65'
            'd2b1779b192b1e736b447c79b22cf80beaa52c159b33f4a148cc1d97b517c6e2')

prepare() {
  _patch_ $pkgname-$pkgver
}

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  # TODO: usr/lib/systemd/user/plasma-kscreen.service
  rm -r $pkgdir/usr/lib/systemd
}
