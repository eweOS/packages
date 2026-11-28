# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fcitx5-qt
pkgver=5.1.17
pkgrel=1
pkgdesc="Fcitx5 Qt Library (Qt5 & Qt6 integrations)"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/fcitx/fcitx5-qt"
license=('GPL')
groups=('fcitx5-im')
depends=('libxkbcommon' 'fcitx5' 'qt6-base' 'qt6-wayland' 'wayland')
makedepends=('extra-cmake-modules' 'qt6-base' 'ninja' 'zstd' 'qt6-base-devel')
source=("https://download.fcitx-im.org/fcitx5/$pkgname/$pkgname-$pkgver.tar.zst")
sha512sums=('8d1e5cae63d566ab2ebbaae29fdef7880b763f400ff167a99abcaf0ea5c46034af87adce3d894201d1ccdb7504b245c20578cf83ebb418c14cf511e7dc355e2b')

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
