# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fcitx5-chinese-addons
pkgver=5.1.13
pkgrel=1
pkgdesc="Addons related to Chinese, including IME previous bundled inside fcitx4"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/fcitx/fcitx5-chinese-addons"
license=('GPL-2.0-or-later')
depends=('boost-libs' 'curl' 'fcitx5-qt' 'libime' 'opencc')
makedepends=('extra-cmake-modules' 'fcitx5-lua' 'fmt' 'ninja' 'zstd' 'boost')
optdepends=('fcitx5-lua: Lua and imeapi support from pinyin')
source=("https://download.fcitx-im.org/fcitx5/$pkgname/$pkgname-${pkgver}_dict.tar.zst")
sha512sums=('4fafa0ed7bf7379771ec59f7d4cc4d308dbaec2fbed1f264ef8e68f6161d301ea0f3ae2e255a88e10bb45410fc77d00fba220254f41af2fc14e883b155e6b6a7')

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
