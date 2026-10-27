# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-jsonpointer
_pyname=python-json-pointer
pkgver=3.6
pkgrel=1
pkgdesc='Python library to resolve RFC 6901 JSON Pointers'
url='https://github.com/stefankoegl/python-json-pointer'
arch=(any)
license=(BSD-3-Clause)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("https://github.com/stefankoegl/python-json-pointer/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2f4d6b0f75f0da7249c437e05678b2fac4824eef0c01578de710f3efef3e8235')

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
