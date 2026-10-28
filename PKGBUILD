# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-coverage
_pyname=coveragepy
pkgver=7.17.0
pkgrel=1
pkgdesc='The code coverage tool for Python'
url='https://coverage.readthedocs.io/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(Apache-2.0)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
# Missing python-flaky, python-virtualenv
# checkdepends=(python-pytest python-pytest-xdist python-flaky python-hypothesis
#		python-unittest-mixins python-virtualenv)
source=("https://github.com/nedbat/coveragepy/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('38c150be4747239cf4e05282977324363868393dae389fd02aa429d44c626b3e')

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
	_install_license_ LICENSE.txt
}
