# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-arrow
_pyname=${pkgname#*-}
pkgver=1.4.0
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
sha256sums=('2288c5977236556f168e9b9d52ab5595d0b08d110566bf0276fff2e4f89bfbfd')

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
