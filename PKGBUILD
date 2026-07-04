# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kpipewire
pkgver=6.5.5
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=4
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
makedepends=(extra-cmake-modules qt6-base-devel)
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz)
sha256sums=('4aacdb440cb09df418228aafce12d2565a894b3a8b98f34f05aa5a6f1ebce354')

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
