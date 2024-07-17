# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-pbr
pkgver=6.0.0
pkgrel=1
pkgdesc='A library for managing setuptools packaging needs in a consistent manner.'
url='https://docs.openstack.org/pbr/latest/'
arch=(any)
license=(Apache-2.0)
depends=(python)
makedepends=(git python-setuptools python-wheel python-build python-installer
	     python-packaging)
source=("git+https://opendev.org/openstack/pbr.git")
sha256sums=('SKIP')

build () {
	cd pbr
	python -m build --wheel --no-isolation
}

# missing dependency, disable check
# check() {
# }

package() {
	cd pbr
	python -m installer --destdir $pkgdir dist/*.whl
	_install_license_ LICENSE
}
