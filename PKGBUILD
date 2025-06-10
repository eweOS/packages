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
# 0001: under review, adjust testsuite to run with pytest 8.4.0
#	https://github.com/pytest-dev/pytest-asyncio/pull/1141
source=("git+https://github.com/pytest-dev/pytest-asyncio.git#tag=v$pkgver"
	"0001-test-Adapt-unmarked-async-tests-in-strict-mode-for-p.patch")
sha256sums=('0e3e4c335ae1384457f961b3d4a329000f8bf0de302a3cb763f1a941a2dbd576'
            'e844cf9279f8597c86c2a28131cdb78d4d05bb60255661ba18e66d1548f3a175')

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
