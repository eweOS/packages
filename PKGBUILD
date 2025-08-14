# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-auditwheel
pkgver=6.4.2
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
sha256sums=('c637ee00640eeb903a01b9f4bd2ed42f98b1724f8f9c9edb480a801f8a4bf4d2')

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
