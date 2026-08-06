# Maintainer: Weird Gumi <weirdgumi@tutamail.com>

pkgname=rime-cangjie
_commit=52d90a1b1312e74042b38c1cbc8142defbc53171
pkgver=20260601.${_commit:0:8}
pkgrel=1
pkgdesc='Rime Cangjie input schema'
arch=(any)
url=https://github.com/rime/rime-cangjie
license=(LGPL-3.0-or-later)
depends=(rime-luna-pinyin)
makedepends=(librime rime-essay rime-prelude)
source=($pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz)
sha256sums=(18d989bf21d0bb86b402f18be4dd060bf2653896c95448afb01d4da2e6be5464)

build() {
  for _schema in $pkgname-$_commit/*.schema.yaml; do
    rime_deployer --compile $_schema $pkgname-$_commit /usr/share/rime-data build
  done
}

package() {
  install -Dm644 -t "$pkgdir"/usr/share/rime-data $pkgname-$_commit/*.yaml
  install -Dm644 -t "$pkgdir"/usr/share/rime-data/build build/*.{bin,yaml}
}
