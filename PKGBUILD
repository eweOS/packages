# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-fqdn
_pyname=${pkgname#*-}
pkgver=1.6.0
pkgrel=1
pkgdesc='RFC-compliant FQDN validation and manipulation for Python'
url='http://fqdn.readthedocs.io/'
arch=(any)
license=(MPL-2.0)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=("https://github.com/ypcrts/fqdn/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6a6374075ad9417368f9f702ceec698cceb41b3ab8202ebc6c3ff03c774e1e73')

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
