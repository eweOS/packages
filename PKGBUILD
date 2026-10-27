# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-pytest-asyncio
pkgver=1.4.1
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
sha256sums=('a3442883c83b7a958d6025cc0e44297af10a5767bb30270f88c6e2b5de896051')

prepare() {
	_patch_ pytest-asyncio
}

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
