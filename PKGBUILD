# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kpipewire
pkgver=6.4.4
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='Components relating to pipewire use in Plasma'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(ffmpeg
         kcoreaddons
         ki18n
         libdrm
         libepoxy
         libpipewire
         libva
         mesa
         qt6-base
         qt6-declarative)
makedepends=(extra-cmake-modules)
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz)
sha256sums=('097f9971580cc7ce3bd89e73ced7606e3978347bd44131d6744fe02d8a1b3ea6')

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
