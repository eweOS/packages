# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-appdirs
pkgver=1.4.4
pkgrel=1
pkgdesc='A small Python module for determining appropriate platform-specific dirs.'
url='https://github.com/ActiveState/appdirs'
arch=(any)
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=("https://github.com/ActiveState/appdirs/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('6db10570b4f0176a05924c20745ff73385497e57829634fb3e756e15636ff408')

build () {
	cd appdirs-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd appdirs-$pkgver
	pytest
}

package() {
	cd appdirs-$pkgver
	python -m installer --destdir=$pkgdir dist/*.whl
}
