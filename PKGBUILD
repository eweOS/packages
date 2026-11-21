# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kio-fuse
pkgver=5.1.1
pkgrel=1
arch=(x86_64 aarch64 riscv64 loongarch64)
pkgdesc='FUSE interface for KIO'
url='https://kde.org/'
license=(GPL-3.0-or-later)
depends=(fuse3
         kcoreaddons
         kio
         qt6-base)
makedepends=(extra-cmake-modules linux-headers)
source=(https://download.kde.org/stable/$pkgname/$pkgname-$pkgver.tar.xz)
sha256sums=('adf6aa7ce055c0987e716a93ac01f3c0a97c1280421443cd6b21e0e71d763d14')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DQT_MAJOR_VERSION=6 \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  rm -r $pkgdir/usr/lib/systemd
}
