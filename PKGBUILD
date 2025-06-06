# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-dogpile.cache
pkgver=1.4.0
# fxxk obs
# _ver=rel_${pkgver//./_}
_ver=rel_1_3_4
pkgrel=1
pkgdesc='Python caching API which provides a generic interface to caching backends of any variety.'
url='https://pypi.org/project/dogpile.cache/'
arch=(any)
license=(MIT)
depends=(python python-decorator python-stevedore)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-mako)
source=("https://github.com/sqlalchemy/dogpile.cache/archive/refs/tags/$_ver.tar.gz")
sha256sums=('c7469a183a2434cc1526c91229e4abcdede2e07e72ade21f9171e14a1df0d494')

build () {
	cd "dogpile.cache-$_ver"
	python -m build --wheel --no-isolation
}

check() {
	cd "dogpile.cache-$_ver"
	pytest -v
}

package() {
	cd "dogpile.cache-$_ver"
	python -m installer --destdir $pkgdir dist/*.whl
	_install_license_ LICENSE
}
