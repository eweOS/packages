# Maintainer: Weird Gumi <weirdgumi@tutamail.com>

pkgname=rime-quick
_commit=5dcdb9e353d314239e9c8cddc0f42d52da4837bb
pkgver=20260717.${_commit:0:8}
pkgrel=1
pkgdesc='Rime Quick input schema'
arch=(any)
url=https://github.com/rime/rime-quick
license=(LGPL-3.0-or-later)
depends=(rime-luna-pinyin)
makedepends=(librime rime-cangjie rime-essay rime-prelude)
source=($pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz)
sha256sums=(2f2ae291b1ebd17ad5bfccfabbeb3aba2a466589628f15172da5fc76b24b9f7e)

build() {
  for _schema in $pkgname-$_commit/*.schema.yaml; do
    rime_deployer --compile $_schema $pkgname-$_commit /usr/share/rime-data build
  done
}

package() {
  install -Dm644 -t "$pkgdir"/usr/share/rime-data $pkgname-$_commit/*.yaml
  install -Dm644 -t "$pkgdir"/usr/share/rime-data/build build/*.{bin,yaml}
}
