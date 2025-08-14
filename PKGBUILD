# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-certifi
pkgver=2025.08.03
pkgrel=1
pkgdesc='Python SSL Certificates.'
url='https://github.com/certifi/python-certifi'
arch=(any)
license=(MPL-2.0)
depends=(python ca-certificates)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=("https://github.com/certifi/python-certifi/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('fdbe80c4c92fc99449759a62e06508667eabbdb04f1ace6010b88028de8d2c97')

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
