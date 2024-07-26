# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-imagesize
_pyname=imagesize_py
pkgver=1.4.1
pkgrel=1
pkgdesc='Module for analyzing image headers and returns image size or DIP.'
url='https://github.com/shibukawa/imagesize_py'
arch=(any)
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=("https://github.com/shibukawa/imagesize_py/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c353adbba9d9e92fc880ff85279c362a9d4fc580c4783d1949e905200cb8b15b')

prepare() {
	# the link now 404....
	rm $_pyname-$pkgver/test/test_get_filelike.py
}

build () {
	cd $_pyname-$pkgver
	python -m build --wheel --no-isolation
}

check() {
	cd $_pyname-$pkgver
	pytest -v
}

package() {
	cd $_pyname-$pkgver
	python -m installer --destdir $pkgdir dist/*.whl
	_install_license_ LICENSE.rst
}
