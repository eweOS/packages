# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-tempora
pkgver=5.7.0
pkgrel=1
pkgdesc='Objects and routines pertaining to date and time (tempora).'
url='https://github.com/jaraco/tempora'
arch=(any)
license=(MIT)
depends=(python python-jaraco.functools python-pytz)
makedepends=(python-build python-wheel python-installer python-setuptools
	     python-setuptools-scm)
# checkdepends=(python-freezegun python-pytest python-pytest-freezegun)
source=("git+$url.git#tag=v$pkgver")
sha256sums=('5af1563b7b32d5cd5689f999745b84223f65bc1ec6f91ffd28b8c75737dda481')

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
