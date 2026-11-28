# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fcitx5-chinese-addons
pkgver=5.1.16
pkgrel=1
pkgdesc="Addons related to Chinese, including IME previous bundled inside fcitx4"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/fcitx/fcitx5-chinese-addons"
license=('GPL-2.0-or-later')
depends=('boost-libs' 'curl' 'fcitx5-qt' 'libime' 'opencc')
makedepends=('extra-cmake-modules' 'fcitx5-lua' 'fmt' 'ninja' 'nlohmann-json' 'zstd' 'boost')
optdepends=('fcitx5-lua: Lua and imeapi support from pinyin')
source=("https://download.fcitx-im.org/fcitx5/$pkgname/$pkgname-${pkgver}_dict.tar.zst")
sha512sums=('4f71d5bc444928842e5bd82f81351e292e72ed9ba3172cc6426f8d8299af1ef2fad3bf82eb22c9cb7f95639afdc138fe19f728002dccb1e79294f60b5b4747e0')

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
