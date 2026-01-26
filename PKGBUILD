# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kactivitymanagerd
pkgver=6.5.5
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
sha256sums=('87a0f8865f180fc69dcab2fe75d9a840fb39c99393c1d37c11a3d3a30171fbf8')

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
