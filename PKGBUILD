# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libime
pkgver=1.1.13
pkgrel=1
pkgdesc="A library to support generic input method implementation"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/fcitx/libime"
license=('LGPL-2.1-or-later')
depends=('boost-libs' 'fcitx5')
makedepends=('boost' 'extra-cmake-modules' 'ninja' 'python' 'zstd')
source=("https://download.fcitx-im.org/fcitx5/libime/libime-${pkgver}_dict.tar.zst")
sha512sums=('57d4ee307a464fd7a581a7da018dfea40185d7b8d888387d6b7f0c0b44084b4e1d69869139f621f31e92fca7a182f1f3c5c3ca2e4483f8730f5469ce9a1c9dc5')

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
