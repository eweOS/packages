# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kaccounts-integration
pkgver=26.08.3
pkgrel=1
pkgdesc='Online account management system and its Plasma integration components'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.kde.org/'
license=(GPL-2.0-or-later)
depends=(kcmutils
         kconfig
         kcoreaddons
         kdbusaddons
         ki18n
         kio
         kirigami
         kwallet
         libaccounts-qt
         qt6-base
         signond)
optdepends=('qt6-declarative: QML plugin')
makedepends=(extra-cmake-modules
             kdoctools
             qcoro)
source=(https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz)
sha256sums=('7b249cb02b867a6bf0b09b2ddea1e774e783b67770af5de7733aa2190e56a680')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
