# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-stevedore
pkgver=5.3.0
pkgrel=2
pkgdesc='Manage dynamic plugins for Python applications.'
url="https://github.com/openstack/stevedore"
arch=(any)
license=(Apache-2.0)
depends=(python)
makedepends=(python-pbr python-setuptools python-wheel python-build
	     python-installer git)
source=("git+https://github.com/openstack/stevedore.git#tag=$pkgver")
sha256sums=('bd074a9aad4c07a9dbc5c84ffc48c4e65d959411ba857f6f604b466a78dfc1aa')
build () {
	cd stevedore
	python -m build --wheel --no-isolation
}

package() {
	cd stevedore
	python -m installer --destdir=$pkgdir dist/*.whl
	_install_license_ LICENSE
}
