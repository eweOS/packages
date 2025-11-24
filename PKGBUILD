# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-stevedore
pkgver=5.6.0
pkgrel=1
pkgdesc='Manage dynamic plugins for Python applications.'
url="https://github.com/openstack/stevedore"
arch=(any)
license=(Apache-2.0)
depends=(python)
makedepends=(python-pbr python-setuptools python-wheel python-build
	     python-installer git)
source=("git+https://github.com/openstack/stevedore.git#tag=$pkgver")
sha256sums=('812f140bbf5ed453a484d5ce283b9d72d53b0be8c099fae80dfc898bb570fb6b')
build () {
	cd stevedore
	python -m build --wheel --no-isolation
}

package() {
	cd stevedore
	python -m installer --destdir=$pkgdir dist/*.whl
	_install_license_ LICENSE
}
