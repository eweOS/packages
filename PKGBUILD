# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libkscreen
pkgver=6.5.5
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=3
pkgdesc='KDE screen management software'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(qt6-base
         qt6-wayland
         wayland)
makedepends=(extra-cmake-modules
             plasma-wayland-protocols
	     qt6-base-devel
             qt6-tools)
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz no-x11.patch)
sha256sums=('595bf06cd8b0c906800a34efd7d93e45add99f2f7e9248c0e8203a838ec861f9'
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
