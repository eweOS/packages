# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-distro
_pyname=${pkgname#*-}
pkgver=1.9.0
pkgrel=1
pkgdesc='OS platform information API for Python'
url='https://distro.readthedocs.io/'
arch=(any)
license=(Apache-2.0)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-pytest-cov)
source=("https://github.com/python-distro/distro/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6ede051357868ed427ea71d16fc27f4d63cc0d9c8a32788aa11c450ecefcc76f')

# TODO: Find an appropriate way to ship the documentation
build() {
	cd "$_pyname-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pyname-$pkgver"
	PYTHONPATH="$PWD/src" pytest -v
}

package() {
	cd "$_pyname-$pkgver"
	python -m installer --destdir "$pkgdir" dist/*.whl
	_install_license_ LICENSE
}
