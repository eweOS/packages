# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-pyelftools
pkgver=0.32
pkgrel=1
pkgdesc='Parsing ELF and DWARF in Python.'
url='https://github.com/eliben/pyelftools'
arch=(any)
license=("custom:Public Domain")
depends=(python)
makedepends=(python-setuptools python-build python-installer python-wheel)
checkdepends=(python-pytest)
source=("https://github.com/eliben/pyelftools/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('82d0399bce74d162fba75b3568ad47bf48ed2c5e028b72026bdc2f678903de7d')

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
