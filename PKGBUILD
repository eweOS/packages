# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kactivitymanagerd
pkgver=6.5.2
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
sha256sums=('9332b5f0fc86f806a480bb45112693a83df906db8eaddc2417459e9a6d7cdf6d')

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
