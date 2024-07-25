# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-pysocks
_pyname=PySocks
pkgver=1.7.0
pkgrel=1
pkgdesc='A SOCKS proxy client and wrapper for Python.'
url='https://github.com/Anorov/PySocks'
arch=(any)
license=(BSD-3-Clause)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-psutil)
source=("https://github.com/Anorov/PySocks/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b6dbd9daf8ebe75c9f76b54c9747d3d1f1d5ac54d540e44b7eb93936ae38b01a')

build () {
	cd $_pyname-$pkgver
	python -m build --wheel --no-isolation
}

# missing python-test_server
# check() {
#	cd $_pyname-$pkgver
# 	pytest -v
# }

package() {
	cd $_pyname-$pkgver
	python -m installer --destdir $pkgdir dist/*.whl
}
