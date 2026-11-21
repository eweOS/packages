# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=phonon-mpv
pkgname=(phonon-qt6-mpv)
pkgver=0.1.0
pkgrel=1
pkgdesc='Phonon MPV backend'
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://github.com/OpenProgger/$pkgbase"
license=('LGPL-2.1-only')
provides=('phonon-qt6-backend')
depends=('mpv' 'phonon-qt6')
makedepends=('extra-cmake-modules')
_snapshot="$pkgbase-$pkgver"
source=("${_snapshot}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('8cba7d803c23267bf7431bf79c4a65a03c767c01026a0cced18985bfa418a076')

build() {
  cmake -B 'build' -S "${_snapshot}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DPHONON_BUILD_QT5=OFF \
    -DPHONON_BUILD_QT6=ON

  cmake --build 'build'
}

package_phonon-qt6-mpv() {
  pkgdesc+=" for Qt6"
  DESTDIR="${pkgdir}" cmake --install 'build'
}
