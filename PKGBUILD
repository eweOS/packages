# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fcitx5-chinese-addons
pkgver=5.1.11
pkgrel=2
pkgdesc="Addons related to Chinese, including IME previous bundled inside fcitx4"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/fcitx/fcitx5-chinese-addons"
license=('GPL-2.0-or-later')
depends=('boost-libs' 'curl' 'fcitx5-qt' 'libime' 'opencc')
makedepends=('extra-cmake-modules' 'fcitx5-lua' 'fmt' 'ninja' 'zstd' 'boost')
optdepends=('fcitx5-lua: Lua and imeapi support from pinyin')
source=("https://download.fcitx-im.org/fcitx5/$pkgname/$pkgname-${pkgver}_dict.tar.zst")
sha512sums=('30c5a8ff6354c46eceaa541b83b81b6e8c325f9695fbfa4e96837ecd80cda0d9ca3c0de3c9c841bf98734937459f4c5ec5eeb01ca2fa0b6fccef0cfff39d8f9e')

build() {
  cd $pkgname-$pkgver

  cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib -DENABLE_BROWSER=Off  .
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
