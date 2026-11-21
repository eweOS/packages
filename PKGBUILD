# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-trio
_pyname=${pkgname#*-}
pkgver=0.35.0
pkgrel=1
pkgdesc='A friendly Python library for async concurrency and I/O'
url='https://trio.readthedocs.io/'
arch=(any)
license=("Apache-2.0 OR MIT")
depends=(python python-attrs python-idna python-outcome python-sniffio
	 python-sortedcontainers python-typing_extensions)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest python-astor python-black python-isort
#		python-jedi python-pylint python-ruff python-trustme)
source=("https://github.com/python-trio/trio/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9a01142cdda05ceded674f41619ddb71ebbbe608eb15f8e4ff7452cf1a7d0842')

build () {
	cd "$_pyname-$pkgver"
	python -m build --wheel --no-isolation
}

# Missing multiple dependencies
# check() {
#	cd "$_pyname-$pkgver"
#	pytest -v
# }

package() {
	cd "$_pyname-$pkgver"
	python -m installer --destdir "$pkgdir" dist/*.whl
}
