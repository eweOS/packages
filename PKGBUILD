# Maintainer: Weird Gumi <weirdgumi@tutamail.com>

pkgname=rime-terra-pinyin
_commit=8a2c895ad7ee8e2b137d91be77f18f86b04d7fc9
pkgver=20260717.${_commit:0:8}
pkgrel=1
pkgdesc='Rime Terra Pinyin input schema'
arch=(any)
url=https://github.com/rime/rime-terra-pinyin
license=(LGPL-3.0-or-later)
depends=(rime-stroke)
makedepends=(librime rime-essay rime-prelude)
source=($pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz)
sha256sums=(7507d3f00d0219f49e538653af1c8462345d0b2e691616145072e5c34584e621)

build() {
  for _schema in $pkgname-$_commit/*.schema.yaml; do
    rime_deployer --compile $_schema $pkgname-$_commit /usr/share/rime-data build
  done
}

package() {
  install -Dm644 -t "$pkgdir"/usr/share/rime-data $pkgname-$_commit/*.yaml
  install -Dm644 -t "$pkgdir"/usr/share/rime-data/build build/*.{bin,yaml}
}
