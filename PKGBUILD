# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-stevedore
pkgver=5.7.0
pkgrel=1
pkgdesc='Manage dynamic plugins for Python applications.'
url="https://github.com/openstack/stevedore"
arch=(any)
license=(Apache-2.0)
depends=(python)
makedepends=(python-pbr python-setuptools python-wheel python-build
	     python-installer git)
source=("git+https://github.com/openstack/stevedore.git#tag=$pkgver")
sha256sums=('fe503190a5e175ab5590d5ef3b5bb8db8476618baaf3972d3ca2e1ff0b048910')
build () {
	cd stevedore
	python -m build --wheel --no-isolation
}

package() {
	cd stevedore
	python -m installer --destdir=$pkgdir dist/*.whl
	_install_license_ LICENSE
}
