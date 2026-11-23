# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libime
pkgver=1.1.17
pkgrel=1
pkgdesc="A library to support generic input method implementation"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/fcitx/libime"
license=('LGPL-2.1-or-later')
depends=('boost-libs' 'fcitx5')
makedepends=('boost' 'extra-cmake-modules' 'ninja' 'python' 'zstd')
source=("https://download.fcitx-im.org/fcitx5/libime/libime-${pkgver}_dict.tar.zst")
sha512sums=('8e92379b0f34a864b93b4dbd96d1087a365fb230f8ff04cbf944f19c453b10a6e3eec3b2f99fa9699008b496a1a2f74d24042ab87c028b40fbbd8799dd07634a')

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
