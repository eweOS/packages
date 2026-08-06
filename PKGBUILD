# Maintainer: Weird Gumi <weirdgumi@tutamail.com>

pkgname=rime-luna-pinyin
_commit=56b934b099dfbeab842320f13aa8b461a6ab3e42
pkgver=20260712.${_commit:0:8}
pkgrel=1
pkgdesc='Rime Luna Pinyin input schema'
arch=(any)
url=https://github.com/rime/rime-luna-pinyin
license=(LGPL-3.0-or-later)
depends=(rime-stroke)
makedepends=(librime rime-essay rime-prelude)
source=($pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz)
sha256sums=(876c7ba559794f476abf7195a255aea29000cee281e6f5ec664928dce018bd90)

build() {
  for _schema in $pkgname-$_commit/*.schema.yaml; do
    rime_deployer --compile $_schema $pkgname-$_commit /usr/share/rime-data build
  done
}

package() {
  install -Dm644 -t "$pkgdir"/usr/share/rime-data $pkgname-$_commit/*.yaml
  install -Dm644 -t "$pkgdir"/usr/share/rime-data/build build/*.{bin,yaml}
}
