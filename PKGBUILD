# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-auditwheel
pkgver=6.3.0
pkgrel=1
pkgdesc='Auditing and relabeling cross-distribution Linux wheels.'
url='https://github.com/pypa/auditwheel'
arch=(any)
license=(MIT)
depends=(python patchelf python-pyelftools python-packaging)
makedepends=(python-build python-installer python-wheel python-setuptools
	     python-setuptools-scm git)
# checkdepends=(python-pytest python-pretend)
source=("git+$url.git#tag=$pkgver")
sha256sums=('4e4274420d3b9715a9c7e5d91ba8b2d809851c73f6ee27e1297781b244e63aa4')

build () {
	cd auditwheel
	python -m build --wheel --no-isolation
}

check() {
	cd auditwheel
	# missing jsonschema, pypatchelf, docker
	# PYTHONPATH=build/lib pytest -v
}

package() {
	cd auditwheel
	python -m installer --destdir $pkgdir dist/*.whl
	_install_license_ LICENSE
}
