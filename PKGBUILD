# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-pyproject-metadata
_name="${pkgname#python-}"
pkgver=0.11.0
pkgrel=1
pkgdesc='PEP 621 metadata parsing'
arch=(any)
url='https://github.com/pypa/python-pyproject-metadata'
license=(MIT)
depends=(python python-packaging)
makedepends=(python-build python-installer python-setuptools python-wheel
	     python-flit-core)
checkdepends=(python-pytest)
source=($url/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('6f56d2c59118027da4d00c1f2df06ebadc296f810576b28ff6b28ee472c2c0cef72b1bbe7d36480679740b1dd91acdc9d693246dfc921b7bf012886f17a87c0d')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  python -m pytest -v
}

package() {
  cd $_name-$pkgver

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
