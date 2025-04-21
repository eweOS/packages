# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-webcolors
_pyname=${pkgname#*-}
pkgver=24.11.1
pkgrel=1
pkgdesc='A library for working with HTML/CSS color formats in Python'
url='https://webcolors.readthedocs.io/en/latest/'
arch=(any)
license=(BSD-3-Clause)
depends=(python)
makedepends=(python-build python-installer python-pdm-backend python-wheel)
checkdepends=(python-pytest)
source=("https://github.com/ubernostrum/webcolors/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('418d7cf788042131cf69789c3420520840efb3d00416cdf1c4a8cf354ec8a09e')

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
