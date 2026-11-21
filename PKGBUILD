# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=phonon
pkgname=(phonon-qt6)
pkgdesc='The multimedia framework by KDE'
pkgver=4.12.0
pkgrel=1
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Phonon'
license=(LGPL-2.1-or-later)
depends=(libpulse)
makedepends=(extra-cmake-modules
             qt6-5compat
             qt6-base
             qt6-tools)
optdepends=('pulseaudio: PulseAudio support')
source=(https://download.kde.org/stable/$pkgbase/$pkgver/$pkgbase-$pkgver.tar.xz)
sha256sums=('3287ffe0fbcc2d4aa1363f9e15747302d0b080090fe76e5f211d809ecb43f39a')

build() {
  cmake -B build6 -S $pkgbase-$pkgver \
    -DCMAKE_BUILD_TYPE=None \
    -DPHONON_BUILD_QT5=OFF
  cmake --build build6
}

package_phonon-qt6(){
  depends+=(qt6-5compat qt6-base phonon-qt6-backend)
  optdepends+=('qt6-tools: Designer plugin')

  DESTDIR="$pkgdir" cmake --install build6
}
