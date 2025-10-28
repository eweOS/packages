# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fcitx5-chinese-addons
pkgver=5.1.10
pkgrel=1
pkgdesc="Addons related to Chinese, including IME previous bundled inside fcitx4"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/fcitx/fcitx5-chinese-addons"
license=('GPL-2.0-or-later')
depends=('boost-libs' 'curl' 'fcitx5-qt' 'libime' 'opencc')
makedepends=('extra-cmake-modules' 'fcitx5-lua' 'fmt' 'ninja' 'zstd' 'boost')
optdepends=('fcitx5-lua: Lua and imeapi support from pinyin')
source=("https://download.fcitx-im.org/fcitx5/$pkgname/$pkgname-${pkgver}_dict.tar.zst")
sha512sums=('02463a781a0b8baf2ad56efc0d34d95bd4f70ec54db0b6a0d1eb2efb7b474bf8008aee5b9c1daf39aef7c4efecb63f0c0af8142271608237e048c48b4b55a6f1')

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
