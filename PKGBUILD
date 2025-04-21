# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-pytest-cov
_pyname=${pkgname#*-}
pkgver=6.1.1
pkgrel=1
pkgdesc='Coverage plugin for pytest'
url='https://pytest-cov.readthedocs.io/en/latest/'
arch=(any)
license=(MIT)
depends=(python python-coverage python-pytest)
makedepends=(python-build python-installer python-setuptools python-wheel)
# Missing python-process-tests python-virtualenv
# checkdepends=(python-fields python-pytest python-pytest-xdist
#		python-process-tests python-virtualenv python)
source=("https://github.com/pytest-dev/pytest-cov/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5fa3b3df2565ddcc3180e0383486c8fb6973656b3790951aaf6ddd8598c6089a')

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
