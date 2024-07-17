# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-beaker
pkgver=1.13.0
pkgrel=1
pkgdesc='WSGI middleware for sessions and caching.'
url='https://beaker.readthedocs.io/en/latest/'
arch=(any)
license=(BSD-3-Clause)
depends=(python)
makedepends=(python-setuptools python-build python-installer python-wheel)
source=("https://github.com/bbangert/beaker/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('3987a336340e884bcec2a2496f2614ee2cd0a171079191f57df25247b6e0c4a7')

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
