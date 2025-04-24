# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-stevedore
pkgver=5.4.1
pkgrel=1
pkgdesc='Manage dynamic plugins for Python applications.'
url="https://github.com/openstack/stevedore"
arch=(any)
license=(Apache-2.0)
depends=(python)
makedepends=(python-pbr python-setuptools python-wheel python-build
	     python-installer git)
source=("git+https://github.com/openstack/stevedore.git#tag=$pkgver")
sha256sums=('5d1fb4b0603bd73236d647e0a9720938c1d69f249dd6fcb8a18906eebe87139d')
build () {
	cd stevedore
	python -m build --wheel --no-isolation
}

package() {
	cd stevedore
	python -m installer --destdir=$pkgdir dist/*.whl
	_install_license_ LICENSE
}
