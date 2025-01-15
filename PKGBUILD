# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-tempora
pkgver=5.8.0
pkgrel=1
pkgdesc='Objects and routines pertaining to date and time (tempora).'
url='https://github.com/jaraco/tempora'
arch=(any)
license=(MIT)
depends=(python python-jaraco.functools python-pytz python-dateutil)
makedepends=(python-build python-wheel python-installer python-setuptools
	     python-setuptools-scm git)
# checkdepends=(python-freezegun python-pytest python-pytest-freezegun)
source=("git+$url.git#tag=v$pkgver")
sha256sums=('6cd75331757dcfa85efe444fe8666866a39fc6a45aea08af00b188818560c20c')

build () {
	cd tempora
	python -m build --wheel --no-isolation
}

check() {
	cd tempora
	# FIXME: missing python-pytest-freezegun
	# pytest -v
}

package() {
	cd tempora
	python -m installer --destdir $pkgdir dist/*.whl
	_install_license_ LICENSE
}
