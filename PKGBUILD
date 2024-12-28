# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-pytest-asyncio
pkgver=0.25.0
pkgrel=1
pkgdesc='Async io support for pytest'
url='https://github.com/pytest-dev/pytest-asyncio'
arch=(any)
license=(Apache-2.0)
depends=(python python-attrs python-pytest)
makedepends=(python-wheel python-build python-installer python-setuptools
	     python-setuptools-scm git)
checkdepends=(python-hypothesis)
source=("git+https://github.com/pytest-dev/pytest-asyncio.git#tag=v$pkgver")
sha256sums=('2af7f2d45f709ab5645483903cacbcef4584e7fbd4f15a4082bf68274cd35627')

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
