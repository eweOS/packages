# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-isodate
_pyname=${pkgname#*-}
pkgver=0.7.2
pkgrel=2
pkgdesc='ISO 8601 date/time parser for Python'
url='https://github.com/gweis/isodate/'
arch=(any)
license=(BSD-3-Clause)
depends=(python python-six)
makedepends=(python-build python-installer python-setuptools python-wheel
	     python-setuptools-scm)
checkdepends=(python-pytest)
source=("https://github.com/gweis/isodate/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('63ee958e14d1606afc908bdb93b96f68a2e3b9253286d25c144e97d295761a22')

build() {
	cd "$_pyname-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pyname-$pkgver"
	PYTHONPATH="$PWD"/src pytest -v
}

package() {
	cd "$_pyname-$pkgver"
	python -m installer --destdir "$pkgdir" dist/*.whl
	_install_license_ LICENSE
}
