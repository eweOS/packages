# Maintainer: Weird Gumi <weirdgumi@tutamail.com>

_name=beniget
pkgname=python-$_name
pkgver=0.5.0
pkgrel=1
pkgdesc='A collection of Compile-time analyse on Python Abstract Syntax Tree (AST)'
arch=(any)
url=https://github.com/serge-sans-paille/beniget
license=(BSD-3-Clause)
depends=(python python-gast)
makedepends=(python-build python-installer python-setuptools)
checkdepends=(python-pytest)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha256sums=(494b61850c7df16c49685a745bbea9e3ed75928fa29cd2a89a00b026e5690948)

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
