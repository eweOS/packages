# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libime
pkgver=1.1.14
pkgrel=1
pkgdesc="A library to support generic input method implementation"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/fcitx/libime"
license=('LGPL-2.1-or-later')
depends=('boost-libs' 'fcitx5')
makedepends=('boost' 'extra-cmake-modules' 'ninja' 'python' 'zstd')
source=("https://download.fcitx-im.org/fcitx5/libime/libime-${pkgver}_dict.tar.zst")
sha512sums=('2afe7dbfe7c087fa45f1175ad08cde59da3d7c8baf9413be6291f36b6786a1501f1b3ca3ec795b3852b1e87a3afb7eb099b258f053c2185ea03bf5885046c88d')

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
