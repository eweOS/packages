# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-pyelftools
pkgver=0.31
pkgrel=1
pkgdesc='Parsing ELF and DWARF in Python.'
url='https://github.com/eliben/pyelftools'
arch=(any)
license=("custom:Public Domain")
depends=(python)
makedepends=(python-setuptools python-build python-installer python-wheel)
checkdepends=(python-pytest)
source=("https://github.com/eliben/pyelftools/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('24815cbfff9c5f68f5268983f55d969540a087bfdaa73c93f1a88e2a771f80f1')

build () {
	cd pyelftools-$pkgver
	python -m build --wheel --no-isolation
}

check() {
	cd pyelftools-$pkgver
	# needs python-utils
	# pytest
}

package() {
	cd pyelftools-$pkgver
	python -m installer --destdir=$pkgdir dist/*.whl
}
