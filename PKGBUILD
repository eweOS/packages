# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-stevedore
pkgver=5.4.0
pkgrel=1
pkgdesc='Manage dynamic plugins for Python applications.'
url="https://github.com/openstack/stevedore"
arch=(any)
license=(Apache-2.0)
depends=(python)
makedepends=(python-pbr python-setuptools python-wheel python-build
	     python-installer git)
source=("git+https://github.com/openstack/stevedore.git#tag=$pkgver")
sha256sums=('440982d9d6b5634e99f995929b03b0d0608d094aee622145f1d5c3459e59da65')
build () {
	cd stevedore
	python -m build --wheel --no-isolation
}

package() {
	cd stevedore
	python -m installer --destdir=$pkgdir dist/*.whl
	_install_license_ LICENSE
}
