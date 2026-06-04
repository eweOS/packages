# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fcitx5-qt
pkgver=5.1.13
pkgrel=3
pkgdesc="Fcitx5 Qt Library (Qt5 & Qt6 integrations)"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/fcitx/fcitx5-qt"
license=('GPL')
groups=('fcitx5-im')
depends=('libxkbcommon' 'fcitx5' 'qt6-base' 'qt6-wayland' 'wayland')
makedepends=('extra-cmake-modules' 'qt6-base' 'ninja' 'zstd' 'qt6-base-devel')
source=("https://download.fcitx-im.org/fcitx5/$pkgname/$pkgname-$pkgver.tar.zst")
sha512sums=('5a2c92fb35fc3015257ad367a9df0be2895c7b9317d801d2c0f973122340792acfa489fb97a664426f3522e967fb6a4e2b127cd3b74a84220d24149f92714e49')

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
