# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-certifi
pkgver=2024.07.04
pkgrel=1
pkgdesc='Python SSL Certificates.'
url='https://github.com/certifi/python-certifi'
arch=(any)
license=(MPL-2.0)
depends=(python ca-certificates)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=("https://github.com/certifi/python-certifi/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('72c602546773d75e1f7aa9cc03f58d43265393d6cc07aa90580fe3608c4b00be')

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
