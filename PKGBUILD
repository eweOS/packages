# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=lxqt-menu-data
pkgver=2.4.0
pkgrel=1
pkgdesc='LXQt menu files'
arch=(any)
url='https://github.com/lxqt/lxqt-menu-data'
license=('GPL' 'LGPL')
makedepends=(cmake lxqt-build-tools qt6-tools)
source=(
  "https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"
)
sha512sums=('a3227024584b23b4149cba1d33072486464c203d4d2f489348f15ec67bdabbd23fbdddc81735348a6d85ed5c3c9c5dee847d15789038bf9688a662eab9a18f1b')

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
