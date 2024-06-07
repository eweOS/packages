# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-mock
pkgver=5.1.0
pkgrel=1
pkgdesc='The Python mock library.'
url='https://mock.readthedocs.io/en/latest/'
arch=(any)
license=(BSD-2-Clause)
depends=(python)
makedepends=(python-setuptools python-build python-installer python-wheel)
checkdepends=(python-pytest)
source=("https://github.com/testing-cabal/mock/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('e3ad0dbebbdab94f7401920e86cb765f50c42f6f88db223c8438c352fc8c136f')

build () {
	cd mock-$pkgver
	python -m build --wheel --no-isolation
}

check() {
	cd mock-$pkgver
	pytest
}

package() {
	cd mock-$pkgver
	python -m installer --destdir=$pkgdir dist/*.whl
}
