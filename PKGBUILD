# Maintainer: Weird Gumi <weirdgumi@tutamail.com>

pkgname=rime-stroke
_commit=3a4b0f4013e2b4c14b1e80c92b1d4723eb65f39c
pkgver=20250923.${_commit:0:8}
pkgrel=1
pkgdesc='Rime Stroke input schema'
arch=(any)
url=https://github.com/rime/rime-stroke
license=(LGPL-3.0-or-later)
makedepends=(librime rime-essay rime-prelude)
source=($pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz)
sha256sums=(14995408f49a8389bbcc50b8865ec8d1d90c26517cdb33f69b4a69b8a5d2ddb8)

build() {
  for _schema in $pkgname-$_commit/*.schema.yaml; do
    rime_deployer --compile $_schema $pkgname-$_commit /usr/share/rime-data build
  done
}

package() {
  install -Dm644 -t "$pkgdir"/usr/share/rime-data $pkgname-$_commit/*.yaml
  install -Dm644 -t "$pkgdir"/usr/share/rime-data/build build/*.{bin,yaml}
}
