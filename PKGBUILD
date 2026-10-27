# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-webcolors
_pyname=${pkgname#*-}
pkgver=25.10.0
pkgrel=1
pkgdesc='A library for working with HTML/CSS color formats in Python'
url='https://webcolors.readthedocs.io/en/latest/'
arch=(any)
license=(BSD-3-Clause)
depends=(python)
makedepends=(python-build python-installer python-pdm-backend python-wheel)
checkdepends=(python-pytest)
source=("https://github.com/ubernostrum/webcolors/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a3bd6927350cef90d782e46b709adcca15af9e03146f6cca507a117ce8cb06ef')

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
