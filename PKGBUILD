# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-beaker
pkgver=1.14.0
pkgrel=1
pkgdesc='WSGI middleware for sessions and caching'
url='https://beaker.readthedocs.io/en/latest/'
arch=(any)
license=(BSD-3-Clause)
depends=(python)
makedepends=(python-setuptools python-build python-installer python-wheel)
source=("https://github.com/bbangert/beaker/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('36e8b4234636067db7d960ceffd7b8d76210ccb47d73335b37d5e8d44209f2a4')

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
