# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-auditwheel
pkgver=6.8.1
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
sha256sums=('ebd6d664aaeda38fece9710b8f4e955b805f61881ca3230b87795484dc4eeb1e')

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
