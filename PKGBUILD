# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fcitx5-chinese-addons
pkgver=5.1.4
pkgrel=2
pkgdesc="Addons related to Chinese, including IME previous bundled inside fcitx4"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/fcitx/fcitx5-chinese-addons"
license=('GPL')
depends=('curl' 'fcitx5-qt' 'libime' 'opencc')
makedepends=('boost' 'extra-cmake-modules' 'fcitx5-lua' 'fmt' 'ninja')
optdepends=('fcitx5-lua: Lua and imeapi support from pinyin')
source=("https://download.fcitx-im.org/fcitx5/$pkgname/$pkgname-${pkgver}_dict.tar.xz")
sha512sums=('99f3cc101532879c126e2699d338528a25531b782a5c1f1e93cd363437567c1ba7b0173aca56f887089d4379e86aecf7977139b5b5c44d54e0bd9a416b01e976')

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
