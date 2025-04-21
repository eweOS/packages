# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-coverage
_pyname=coveragepy
pkgver=7.8.0
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
sha256sums=('cf7df6b3d80b3204f666a1257ec1bfeab823a00c07857a049b296ee68ce57cf9')

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
