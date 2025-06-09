# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-portend
pkgver=3.2.1
pkgrel=1
pkgdesc='Use portend to monitor TCP ports for bound or unbound states.'
url='https://github.com/jaraco/portend'
arch=(any)
license=(MIT)
depends=(python python-tempora)
makedepends=(python-wheel python-build python-installer python-setuptools
	     python-setuptools-scm git)
checkdepends=(python-pytest)
source=("git+$url.git#tag=v$pkgver")
sha256sums=('b0c7bcbb7374b5e8f444e8a98c015a15abbc777ba9c2c214ac35f0d658ca14df')

build() {
	cd portend
	python -m build --wheel --no-isolation
}

check() {
	cd portend
	pytest -v
}

package() {
	cd portend
	python -m installer --destdir $pkgdir dist/*.whl
	_install_license_ LICENSE
}
