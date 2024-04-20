# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-pyproject-metadata
_name="${pkgname#python-}"
pkgver=0.7.1
pkgrel=1
pkgdesc='PEP 621 metadata parsing'
arch=(any)
url='https://github.com/pypa/python-pyproject-metadata'
license=(MIT)
depends=(python python-packaging)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=($url/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('3decbe7dae753bc03c0b3459a53707c34b7a4e140632da15c8234876d6cb07f43f8bb65e3661c68950fd3eac37904316767617954a057c606d0158e8982e0afa')

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
