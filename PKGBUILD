# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-auditwheel
pkgver=6.2.0
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
sha256sums=('3539e5cc3626dd439feeb7bb858f3eb0b7a76c255a033531f945e75c3e0f99c9')

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
