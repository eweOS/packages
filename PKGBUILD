# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-certifi
pkgver=2024.12.14
pkgrel=1
pkgdesc='Python SSL Certificates.'
url='https://github.com/certifi/python-certifi'
arch=(any)
license=(MPL-2.0)
depends=(python ca-certificates)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=("https://github.com/certifi/python-certifi/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d9045cb5da5ee9678db7020990535a41dfb0779999adbedb375ae7dfdeb4b894')

build () {
	cd $pkgname-$pkgver
	python -m build --wheel --no-isolation
}

check() {
	cd $pkgname-$pkgver
	pytest -v
}

package() {
	cd $pkgname-$pkgver
	python -m installer --destdir $pkgdir dist/*.whl
	_install_license_ LICENSE
}
