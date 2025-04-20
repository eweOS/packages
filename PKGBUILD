# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-fqdn
_pyname=${pkgname#*-}
pkgver=1.5.1
pkgrel=1
pkgdesc='RFC-compliant FQDN validation and manipulation for Python'
url='http://fqdn.readthedocs.io/'
arch=(any)
license=(MPL-2.0)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=("https://github.com/ypcrts/fqdn/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a2c026226f1a1eaace81362fda27b3df479693aefe19f160d6c4c3a032add498')

build() {
	cd "$_pyname-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pyname-$pkgver"
	pytest -v
}

package() {
	cd "$_pyname-$pkgver"
	python -m installer --destdir "$pkgdir" dist/*.whl
}
