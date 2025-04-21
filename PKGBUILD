# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-arrow
_pyname=${pkgname#*-}
pkgver=1.3.0
pkgrel=1
pkgdesc='A Python library that offers a sensible and human-friendly approach to creating, manipulating, formatting and converting dates, times and timestamps'
url='https://arrow.readthedocs.io/en/latest/'
arch=(any)
license=(Apache-2.0)
depends=(python python-dateutil)
makedepends=(python-build python-installer python-setuptools python-wheel
	     python-flit-core)
checkdepends=(python-pytest python-pytest-cov python-pytest-mock python-pytz
	      python-simplejson)
source=("https://github.com/arrow-py/arrow/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('108c9d0339dbb06f6a255d1e8399a9bd88ec53ae6ede044b4ca7b3c563184a1b')

build() {
	cd "$_pyname-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pyname-$pkgver"
	pytest -v
}

package() {
	cd "$_pyname-$pkgver"
	python -m installer --destdir "$pkgdir" dist/*.whl
	_install_license_ LICENSE
}
