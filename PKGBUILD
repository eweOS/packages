# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-dogpile.cache
pkgver=1.3.3
_ver=rel_${pkgver//./_}
pkgrel=1
pkgdesc='ython caching API which provides a generic interface to caching backends of any variety.'
url='https://pypi.org/project/dogpile.cache/'
arch=(any)
license=(MIT)
depends=(python python-decorator python-stevedore)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest python-mako)
source=("https://github.com/sqlalchemy/dogpile.cache/archive/refs/tags/$_ver.tar.gz")
sha256sums=('3810465974f135686f22d0b6efa67e57bd6b3940fbfc61eb25c204fa45f5876b')

build () {
	cd dogpile.cache-$_ver
	python -m build --wheel --no-isolation
}

# disable temporarily for bootstrapping
# check() {
#	cd dogpile.cache-$_ver
#	pytest -v
#}

package() {
	cd dogpile.cache-$_ver
	python -m installer --destdir $pkgdir dist/*.whl
	_install_license_ LICENSE
}
