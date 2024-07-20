# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-mako
pkgver=1.3.5
_pkgver=rel_${pkgver//./_}
pkgrel=1
pkgdesc='A template library written in Python.'
url='https://pypi.org/project/Mako/'
arch=(any)
license=(MIT)
depends=(python python-markupsafe)
optdepends=("python-babel: for i18n features"
	    "python-beaker: for caching support"
	    "python-dogpile.cache: for caching support"
	    "python-pygments: for syntax highlighting")
makedepends=(python-wheel python-installer python-build python-setuptools)
checkdepends=(python-pytest python-babel python-beaker python-dogpile.cache
	      python-pygments python-pytest)
source=("https://github.com/sqlalchemy/mako/archive/refs/tags/$_pkgver.tar.gz")
sha256sums=('abaf7d76e50d92ce6218a8437ea6ef93905598050099eb125c37dc55a5fffe32')

build () {
	cd mako-$_pkgver
	python -m build --wheel --no-isolation
}

check() {
	cd mako-$_pkgver
	pytest -v
}

package() {
	cd mako-$_pkgver
	python -m installer --destdir=$pkgdir dist/*.whl
	_install_license_ LICENSE
}
