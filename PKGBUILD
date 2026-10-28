# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fcitx5-chinese-addons
pkgver=5.1.15
pkgrel=1
pkgdesc="Addons related to Chinese, including IME previous bundled inside fcitx4"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/fcitx/fcitx5-chinese-addons"
license=('GPL-2.0-or-later')
depends=('boost-libs' 'curl' 'fcitx5-qt' 'libime' 'opencc')
makedepends=('extra-cmake-modules' 'fcitx5-lua' 'fmt' 'ninja' 'zstd' 'boost')
optdepends=('fcitx5-lua: Lua and imeapi support from pinyin')
source=("https://download.fcitx-im.org/fcitx5/$pkgname/$pkgname-${pkgver}_dict.tar.zst")
sha512sums=('10aaf7b8d1cfaae111923b71cb52d60f102e586c75a626bebccf30edbc7cb305125e7269f3886453c5b8c1876428fe2a4a348ed6425e0ec3ad7dcabe11df0b4c')

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
