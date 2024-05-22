# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libime
pkgver=1.1.7
pkgrel=1
pkgdesc="A library to support generic input method implementation"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/fcitx/libime"
license=('LGPL-2.1-or-later')
depends=('boost-libs' 'fcitx5')
makedepends=('boost' 'extra-cmake-modules' 'ninja' 'python' 'zstd')
source=("https://download.fcitx-im.org/fcitx5/libime/libime-${pkgver}_dict.tar.zst")
sha512sums=('67b69fe33e2a55cf9f82c668f3c97929fe8a0531e1540fa593ef15535ba66e079171928a54b268638a1d5fd14901f47500d1a6f79ad0e28f7f81e426f1384b42')

build(){
  cd $pkgname-$pkgver

  cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib .
  ninja
}

check() {
  cd $pkgname-$pkgver
  ninja test
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" ninja install
}
