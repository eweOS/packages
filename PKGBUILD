# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=lxqt-menu-data
pkgver=2.3.0
pkgrel=1
pkgdesc='LXQt menu files'
arch=(any)
url='https://github.com/lxqt/lxqt-menu-data'
license=('GPL' 'LGPL')
makedepends=(cmake lxqt-build-tools qt6-tools)
source=(
  "https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"
)
sha512sums=('4b64267e39bddad3096402824ff482697eccd6d036ef66a8ca81918c06778819f4d0400e1c728b4e056be6a45d39e80f6e3a1fcad932112db521eb5eee68f683')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None
  make -C build
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
