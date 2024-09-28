# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=libqaccessibilityclient
pkgname=(libqaccessibilityclient-qt6)
pkgver=0.6.0
pkgrel=1
arch=(x86_64 aarch64 riscv64)
pkgdesc='Helper library to make writing accessibility tools easier'
url='https://www.kde.org'
license=(LGPL2.1)
makedepends=(extra-cmake-modules
             qt6-base)
source=(https://download.kde.org/stable/$pkgbase/$pkgbase-$pkgver.tar.xz)
sha256sums=('4c50c448622dc9c5041ed10da7d87b3e4e71ccb49d4831a849211d423c5f5d33')

build() {
  cmake -B build6 -S $pkgbase-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DQT_MAJOR_VERSION=6 \
    -DBUILD_TESTING=OFF
  cmake --build build6
}

package_libqaccessibilityclient-qt6() {
  depends+=(qt6-base)

  DESTDIR="$pkgdir" cmake --install build6
}
