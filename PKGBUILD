# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-pytest-asyncio
pkgver=0.24.0
pkgrel=1
pkgdesc='Async io support for pytest'
url='https://github.com/pytest-dev/pytest-asyncio'
arch=(any)
license=(Apache-2.0)
depends=(python python-attrs python-pytest)
makedepends=(python-wheel python-build python-installer python-setuptools
	     python-setuptools-scm)
checkdepends=(python-hypothesis)
source=("git+https://github.com/pytest-dev/pytest-asyncio.git#tag=v$pkgver")
sha256sums=('f3e68e0480d147d7000a34abcf6756e86f9e9544869eaddb1110ef4f0b91bf79')

build () {
	cd pytest-asyncio
	python -m build --wheel --no-isolation
}

check() {
	cd pytest-asyncio
	PYTHONPATH=$PWD pytest -v
}

package() {
	cd pytest-asyncio
	python -m installer --destdir=$pkgdir dist/*.whl
	_install_license_ LICENSE
}
