# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-pytest-mock
pkgver=3.17.0
pkgrel=1
pkgdesc='Thin-wrapper around the mock package for easier use with pytest.'
url='https://github.com/pytest-dev/pytest-mock'
arch=(any)
license=(MIT)
depends=(python-pytest)
makedepends=(python-build python-installer python-setuptools
	     python-setuptools-scm python-wheel git)
checkdepends=(python-pytest-asyncio)
source=("git+https://github.com/pytest-dev/pytest-mock.git#tag=v$pkgver")
sha256sums=('1a2588c131c5c0a015038055756ceaaa6e7ac4b7cad9a5cfc6099187a673b3f3')

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
