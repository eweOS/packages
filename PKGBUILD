# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-pytest-mock
pkgver=3.14.0
pkgrel=1
pkgdesc='Thin-wrapper around the mock package for easier use with pytest.'
url='https://github.com/pytest-dev/pytest-mock'
arch=(any)
license=(MIT)
depends=(python-pytest python-mock)
makedepends=(python-build python-installer python-setuptools
	     python-setuptools-scm python-wheel)
checkdepends=(python-pytest-asyncio)
source=("git+https://github.com/pytest-dev/pytest-mock.git#tag=v$pkgver")
sha256sums=('SKIP')

build () {
	cd pytest-mock
	python -m build --wheel --no-isolation
}

check() {
	cd pytest-mock
	python -m venv tmpenv --system-site-packages
	tmpenv/bin/python -m installer dist/*.whl
	tmpenv/bin/python -m pytest
}

package() {
	cd pytest-mock
	python -m installer --destdir=$pkgdir dist/*.whl
	_install_license_ LICENSE
}
