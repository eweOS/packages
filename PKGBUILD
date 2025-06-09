# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-pytest-asyncio
pkgver=1.0.0
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
sha256sums=('0e3e4c335ae1384457f961b3d4a329000f8bf0de302a3cb763f1a941a2dbd576')

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
