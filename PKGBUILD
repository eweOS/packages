# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libime
pkgver=1.1.9
pkgrel=1
pkgdesc="A library to support generic input method implementation"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/fcitx/libime"
license=('LGPL-2.1-or-later')
depends=('boost-libs' 'fcitx5')
makedepends=('boost' 'extra-cmake-modules' 'ninja' 'python' 'zstd')
source=("https://download.fcitx-im.org/fcitx5/libime/libime-${pkgver}_dict.tar.zst")
sha512sums=('07b687c98cf0c4e8fc4852fd633ad05de58e32a3c70e58d1c0a84c8862f1843a0421c9a11a9c5653bbb8b1da37d3aee91f2207dbeed12aa49e041e9b08b8dca9')

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
