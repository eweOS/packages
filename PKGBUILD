# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-pyproject-metadata
_name="${pkgname#python-}"
pkgver=0.10.0
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
sha512sums=('85b4104cf28610bb7771dc69a1c024bffb3cb51f430aaae0e342af87559c8af9df9fddbf9381c4edeebf396ba1b96582826c6a3a745edb278845949d77375370')

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
