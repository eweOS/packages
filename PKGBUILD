# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-decorator
pkgver=5.1.1
pkgrel=1
pkgdesc='Decorators for Humans.'
url='https://github.com/micheles/decorator'
arch=(any)
license=(BSD-2-Clause)
depends=(python)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("https://github.com/micheles/decorator/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('4bf091ddbb2da9b2a513469c207aa5e855d3cba7524076e8487021813135fc1c')

build () {
	cd decorator-$pkgver
	python -m build --wheel --no-isolation
}

check() {
	cd decorator-$pkgver/src
	PYTHONPATH=. python tests/test.py
}

package() {
	cd decorator-$pkgver
	python -m installer --destdir $pkgdir dist/*.whl
	_install_license_ LICENSE.txt
}
