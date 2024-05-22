# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fcitx5-chinese-addons
pkgver=5.1.5
pkgrel=1
pkgdesc="Addons related to Chinese, including IME previous bundled inside fcitx4"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/fcitx/fcitx5-chinese-addons"
license=('GPL')
depends=('curl' 'fcitx5-qt' 'libime' 'opencc')
makedepends=('boost' 'extra-cmake-modules' 'fcitx5-lua' 'fmt' 'ninja' 'zstd')
optdepends=('fcitx5-lua: Lua and imeapi support from pinyin')
source=("https://download.fcitx-im.org/fcitx5/$pkgname/$pkgname-${pkgver}_dict.tar.zst")
sha512sums=('50559f1f2ffa89eb24ce58a14c3ca21f3c1092961ce90b925fcf89a029d65c0aee3601d89003be5e92f9f1697e72d5eb2dade06863256a9a615f8be9ec2b2fe5')

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
