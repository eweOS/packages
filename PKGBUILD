# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kactivitymanagerd
pkgver=6.4.4
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='System service to manage user activities and track the usage patterns'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(llvm-libs
         musl
         kconfig
         kcoreaddons
         kcrash
         kglobalaccel
         ki18n
         kio
         kservice
         kxmlgui
         qt6-base)
makedepends=(boost
             extra-cmake-modules)
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz)
sha256sums=('38f24d9529810495db1a2d0f102a89885d22813f131fb6453b79d898bfcbe2a4')

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  rm -r $pkgdir/usr/lib/systemd
}
