# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-stevedore
pkgver=5.2.0
pkgrel=1
pkgdesc='Manage dynamic plugins for Python applications.'
url='Manage dynamic plugins for Python applications.'
arch=(any)
license=(Apache-2.0)
depends=(python)
makedepends=(python-pbr python-setuptools python-wheel python-build
	     python-installer)
source=("git+https://github.com/openstack/stevedore.git#tag=$pkgver")
sha256sums=('SKIP')
build () {
	cd stevedore
	python -m build --wheel --no-isolation
}

package() {
	cd stevedore
	python -m installer --destdir=$pkgdir dist/*.whl
	_install_license_ LICENSE
}
