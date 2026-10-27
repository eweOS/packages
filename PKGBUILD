# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-beaker
pkgver=1.14.1
pkgrel=1
pkgdesc='WSGI middleware for sessions and caching'
url='https://beaker.readthedocs.io/en/latest/'
arch=(any)
license=(BSD-3-Clause)
depends=(python)
makedepends=(python-setuptools python-build python-installer python-wheel)
source=("https://github.com/bbangert/beaker/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('0033f2dfa89ae5f700b77875c6989172e6f4bf1170a3227f066e63c5b6e6f83f')

build () {
	cd beaker-$pkgver
	python -m build --wheel --no-isolation
}

# missing dependency, no check

package() {
	cd beaker-$pkgver
	python -m installer --destdir $pkgdir dist/*.whl
	_install_license_ LICENSE
}
