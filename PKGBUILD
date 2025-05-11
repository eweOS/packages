# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=lxqt-menu-data
pkgver=2.2.0
pkgrel=1
pkgdesc='LXQt menu files'
arch=(any)
url='https://github.com/lxqt/lxqt-menu-data'
license=('GPL' 'LGPL')
makedepends=(cmake lxqt-build-tools qt6-tools)
source=(
  "https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"
)
sha512sums=('9afe61e7280e99e47dbc4fa156634dfc56908f5367d98f194834e61dc963850b188a3fb76088940724c726fcc695859a3f57f0381a5047a53264ff87585d0ee6')

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
