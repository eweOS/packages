# Maintainer: Yao Zi <me@ziyao.cc>

pkgname=python-parameterized
_pyname=${pkgname#*-}
pkgver=0.9.0
pkgrel=1
pkgdesc='Parameterized testing with any Python test framework'
url='https://github.com/wolever/parameterized'
arch=(any)
license=(BSD-2-Clause)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("https://github.com/wolever/parameterized/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8a0e5a7c0455f05acbddfc9dc6b8d270281796b09046aefb28b57cab6f7615f9')

build() {
	cd "$_pyname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pyname-$pkgver"
	python -m installer --destdir "$pkgdir" dist/*.whl
	_install_license_ LICENSE.txt
}
