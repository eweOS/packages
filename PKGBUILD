# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-certifi
pkgver=2026.10.19
pkgrel=1
pkgdesc='Python SSL Certificates.'
url='https://github.com/certifi/python-certifi'
arch=(any)
license=(MPL-2.0)
depends=(python ca-certificates)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=("https://github.com/certifi/python-certifi/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('8080c57422282dcaea398e9ad36c2571410a74472f1e705b2c3366a2cfbe22f9')

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
