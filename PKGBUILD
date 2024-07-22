# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-pyproject-metadata
_name="${pkgname#python-}"
pkgver=0.8.0
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
sha512sums=('8d8c7839a318acce64b0cf15b3adbc49c2f309b453135b55f2d7942967ba8bbd4f85696d0f3c651e1246c50e33657e6108f0f05ac20b4a9162cdb2875269c548')

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
