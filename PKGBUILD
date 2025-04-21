# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-jsonpointer
_pyname=python-json-pointer
pkgver=3.0.0
pkgrel=1
pkgdesc='Python library to resolve RFC 6901 JSON Pointers'
url='https://github.com/stefankoegl/python-json-pointer'
arch=(any)
license=(BSD-3-Clause)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("https://github.com/stefankoegl/python-json-pointer/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('32d99605d78605246b5a99aa4b936a1eaed406552aea600a47866a900395cb2b')

build() {
	cd "$_pyname-$pkgver"
	python -m build --wheel --no-isolation
}

# There's no testsuite

package() {
	cd "$_pyname-$pkgver"
	python -m installer --destdir "$pkgdir" dist/*.whl
	_install_license_ LICENSE.txt
}
