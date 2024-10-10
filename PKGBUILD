# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fcitx5-qt
pkgver=5.1.7
pkgrel=1
pkgdesc="Fcitx5 Qt Library (Qt5 & Qt6 integrations)"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/fcitx/fcitx5-qt"
license=('GPL')
groups=('fcitx5-im')
depends=('libxkbcommon' 'fcitx5' 'qt6-base' 'qt6-wayland' 'wayland')
makedepends=('extra-cmake-modules' 'qt6-base' 'ninja' 'zstd')
source=("https://download.fcitx-im.org/fcitx5/$pkgname/$pkgname-$pkgver.tar.zst")
sha512sums=('1078c3f275fa883b7b9bf2e1b71e926c9f639f637f4838fe0401648a73338c3b9e08c1e83cd8ab44994b4450983247a6882c42b012e4642111592050ee2ce144')

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
