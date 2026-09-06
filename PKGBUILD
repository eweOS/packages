# Maintainer: Weird Gumi <weirdgumi@tutamail.com>

_name=gast
pkgname=python-$_name
pkgver=0.7.0
pkgrel=1
pkgdesc="A generic AST to represent Python2 and Python3's Abstract Syntax Tree (AST)"
arch=(any)
url=https://github.com/serge-sans-paille/gast
license=(BSD-3-Clause)
depends=(python)
makedepends=(python-build python-installer python-setuptools)
checkdepends=(python-pytest)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha256sums=(07926a53d1168eb73ae5e23a81e5a2f03819cb197a91657968d9fe1b00aac1c5)

build() {
  cd $_name-$pkgver
  python -m build -wn
}

check() {
  cd $_name-$pkgver
  pytest
}

package() {
  cd $_name-$pkgver
  python -m installer -d "$pkgdir" dist/*.whl

  local sitepkgs=$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')
  install -d "$pkgdir"/usr/share/licenses
  ln -s $sitepkgs/$_name-$pkgver.dist-info/licenses/LICENSE "$pkgdir"/usr/share/licenses/$pkgname
}
