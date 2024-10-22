# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fcitx5-qt
pkgver=5.1.8
pkgrel=1
pkgdesc="Fcitx5 Qt Library (Qt5 & Qt6 integrations)"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/fcitx/fcitx5-qt"
license=('GPL')
groups=('fcitx5-im')
depends=('libxkbcommon' 'fcitx5' 'qt6-base' 'qt6-wayland' 'wayland')
makedepends=('extra-cmake-modules' 'qt6-base' 'ninja' 'zstd')
source=("https://download.fcitx-im.org/fcitx5/$pkgname/$pkgname-$pkgver.tar.zst")
sha512sums=('ecd9131b2266888345363c39bf4446f6d6d127662d0e67a9837a106f6124d189fa0c74e0cac3f3a6680a3d533316fb6333a83fca1cf9c90561e0b84174abbabd')

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
