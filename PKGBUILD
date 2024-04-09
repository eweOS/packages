# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fcitx5-qt
pkgver=5.1.5
pkgrel=1
pkgdesc="Fcitx5 Qt Library (Qt5 & Qt6 integrations)"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/fcitx/fcitx5-qt"
license=('GPL')
groups=('fcitx5-im')
depends=('libxkbcommon' 'fcitx5' 'qt6-base' 'qt6-wayland' 'wayland')
makedepends=('extra-cmake-modules' 'qt6-base' 'ninja')
source=("https://download.fcitx-im.org/fcitx5/$pkgname/$pkgname-$pkgver.tar.xz")
sha512sums=('736677a268d345a962e8c44af81870d2cfc62db72c7a089e2c11151f7f682659ec83307a3397d1feb2dda7e9419847d5e365f7a20ca9b7d6216b690cb9c515c7')

build(){
  cd $pkgname-$pkgver

  cmake . -GNinja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_INSTALL_LIBEXECDIR=/usr/lib \
    -DENABLE_X11=OFF \
    -DENABLE_QT5=OFF \
    -DENABLE_QT4=OFF
  ninja
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" ninja install
}
