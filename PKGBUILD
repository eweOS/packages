# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-pytest-cov
_pyname=${pkgname#*-}
pkgver=7.0.0
pkgrel=1
pkgdesc='Coverage plugin for pytest'
url='https://pytest-cov.readthedocs.io/en/latest/'
arch=(any)
license=(MIT)
depends=(python python-coverage python-pytest)
makedepends=(python-build python-installer python-hatchling python-hatch-fancy-pypi-readme)
# Missing python-process-tests python-virtualenv
# checkdepends=(python-fields python-pytest python-pytest-xdist
#		python-process-tests python-virtualenv python)
source=("https://github.com/pytest-dev/pytest-cov/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1cdb87c01ae41c57ff173c2bdf6a03085f8713c2d4ef8af795f60826d62eee1a')

build() {
	cd "$_pyname-$pkgver"
	python -m build --wheel --no-isolation
}

# check() {
#	cd "$_pyname-$pkgver"
#	pytest -v
# }

package() {
	cd "$_pyname-$pkgver"
	python -m installer --destdir "$pkgdir" dist/*.whl
}
