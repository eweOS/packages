# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fcitx5-chinese-addons
pkgver=5.1.6
pkgrel=2
pkgdesc="Addons related to Chinese, including IME previous bundled inside fcitx4"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/fcitx/fcitx5-chinese-addons"
license=('GPL')
depends=('curl' 'fcitx5-qt' 'libime' 'opencc')
makedepends=('boost' 'extra-cmake-modules' 'fcitx5-lua' 'fmt' 'ninja' 'zstd')
optdepends=('fcitx5-lua: Lua and imeapi support from pinyin')
source=("https://download.fcitx-im.org/fcitx5/$pkgname/$pkgname-${pkgver}_dict.tar.zst")
sha512sums=('f130f4492977662916a1591048832a37ec306f3664a2c5bc5225ba220ea5ffebc3ef78022b2b6d2d8475b556285a0d45508eaf00473f5b636d2e56a7c73d2f38')

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
