# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kpipewire
pkgver=6.8.3
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
makedepends=(extra-cmake-modules qt6-base-devel)
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz)
sha256sums=('6b3175c928322e2084f8c40e51c05c24e3823b05195ff6de7db27c130a19c12f')

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
