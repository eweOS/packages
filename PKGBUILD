# Maintainer: Weird Gumi <weirdgumi@tutamail.com>

pkgname=rime-bopomofo
_commit=6085c9a38a4a728047862b33d67eee18aa86f3b9
pkgver=20260509.${_commit:0:8}
pkgrel=1
pkgdesc='Rime Bopomofo input schema'
arch=(any)
url=https://github.com/rime/rime-bopomofo
license=(LGPL-3.0-or-later)
depends=(rime-stroke rime-terra-pinyin)
makedepends=(librime rime-essay rime-prelude)
source=($pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz)
sha256sums=(5fc0719e8fe9b2eb8aa05c505ffb2b39d972e637951531182dd7d745a83bda51)

build() {
  for _schema in $pkgname-$_commit/*.schema.yaml; do
    rime_deployer --compile $_schema $pkgname-$_commit /usr/share/rime-data build
  done
}

package() {
  install -Dm644 -t "$pkgdir"/usr/share/rime-data $pkgname-$_commit/*.yaml
  install -Dm644 -t "$pkgdir"/usr/share/rime-data/build build/{bopomofo,detenele}*.{bin,yaml}
}
